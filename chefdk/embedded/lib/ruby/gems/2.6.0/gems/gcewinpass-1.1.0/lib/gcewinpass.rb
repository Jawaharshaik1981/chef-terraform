#
# Author:: Chef Partner Engineering (<partnereng@chef.io>)
# Copyright:: Copyright (c) 2016 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'gcewinpass/version'
require 'google/apis/compute_v1'
require 'base64'
require 'json'
require 'openssl'
require 'time'
require 'timeout'

class GoogleComputeWindowsPassword
  attr_reader :api, :project, :zone, :instance_name, :username, :email, :debug

  def initialize(opts = {})
    validate_options!(opts)

    @api = Google::Apis::ComputeV1::ComputeService.new
    @api.authorization = authorization

    @project       = opts[:project]
    @zone          = opts[:zone]
    @instance_name = opts[:instance_name]
    @email         = opts[:email]
    @username      = opts.fetch(:username, 'Administrator')
    @debug         = opts.fetch(:debug, false)
    @timeout       = opts.fetch(:timeout, 120)
  end

  def new_password
    raise "Unable to locate instance #{instance_name} in project #{project}, zone #{zone}" unless instance_exists?

    update_instance_metadata
    password_from_instance
  end

  def validate_options!(opts)
    raise 'Project not specified'                   unless opts[:project]
    raise 'Zone not specified'                      unless opts[:zone]
    raise 'Instance name not specified'             unless opts[:instance_name]
    raise 'Email address of GCE user not specified' unless opts[:email]
  end

  def authorization
    @authorization ||= Google::Auth.get_application_default(
      [
        'https://www.googleapis.com/auth/cloud-platform',
        'https://www.googleapis.com/auth/compute',
      ]
    )
  end

  def instance
    @instance ||= api.get_instance(project, zone, instance_name)
  end

  def instance_exists?
    instance
  rescue Google::Apis::ClientError
    false
  else
    true
  end

  def instance_metadata
    instance.metadata
  end

  def password_request
    {
      'userName' => username,
      'modulus'  => modulus,
      'exponent' => exponent,
      'email'    => email,
      'expireOn' => expiration_date,
    }
  end

  def password_request_metadata
    Google::Apis::ComputeV1::Metadata::Item.new.tap do |item|
      item.key = 'windows-keys'
      item.value = password_request.to_json
    end
  end

  def update_instance_metadata
    instance_metadata.items = [] if instance_metadata.items.nil?
    instance_metadata.items = instance_metadata.items.select { |item| item.key != 'windows-keys' }
    instance_metadata.items << password_request_metadata

    log_debug("Updating instance #{instance_name} metadata with: #{instance_metadata.inspect}")

    wait_for_operation(api.set_instance_metadata(project, zone, instance_name, instance_metadata))

    log_debug('Instance metadata updated.')
  end

  def private_key
    @private_key ||= OpenSSL::PKey::RSA.new(2048)
  end

  def public_key
    @public_key ||= private_key.public_key
  end

  def modulus
    Base64.strict_encode64(public_key.to_der[33, 256])
  end

  def exponent
    Base64.strict_encode64(public_key.to_der[291, 3])
  end

  def expiration_date
    (Time.now + 300).to_datetime.rfc3339
  end

  def password_from_instance
    response = response_from_console_port
    raise 'Password agent attempted the reset but did not succeed' if response['passwordFound'] == false

    private_key.private_decrypt(Base64.strict_decode64(response['encryptedPassword']), OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
  end

  def response_from_console_port
    log_debug('fetching password from console port')

    Timeout.timeout(timeout) do
      loop do
        api.get_instance_serial_port_output(project, zone, instance_name, port: 4).contents.lines.reverse_each do |line|
          line.strip!

          begin
            event = JSON.parse(line)
          rescue JSON::ParserError
            next
          end

          if event['modulus'] == modulus && event['exponent'] == exponent
            log_debug('modulus and exponent found - returning event')
            return event
          end
        end

        log_debug('event not found, sleeping...')
        sleep 5
      end
    end
  rescue Timeout::Error
    raise Timeout::Error, 'Timeout while waiting for password agent to perform password reset'
  end

  def wait_for_operation(operation_obj)
    operation_name = operation_obj.name

    begin
      Timeout.timeout(timeout) do
        loop do
          operation = operation(operation_name)
          log_debug("Current operation status: #{operation.status}")
          break if operation.status == 'DONE'

          sleep 2
        end
      end
    rescue Timeout::Error
      raise Timeout::Error, 'Timeout while performing GCE API operation'
    end

    check_operation_for_errors!(operation_name)
    log_debug('Operation completed successfully.')
  end

  def check_operation_for_errors!(operation_name)
    operation = operation(operation_name)
    unless operation.error.nil?
      errors = operation.error.errors.each_with_object([]) do |error, memo|
        memo << "#{error.code}: #{error.message}"
      end

      raise "Operation failed: #{errors.join(', ')}"
    end
  end

  def operation(operation_name)
    api.get_zone_operation(project, zone, operation_name)
  end

  def log_debug(msg)
    $stderr.puts msg if debug
  end

  def timeout
    @timeout.to_i
  end
end
