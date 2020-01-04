#
# Copyright:: Copyright (c) 2018 Chef Software Inc.
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

require "telemetry"
require "chef_apply/telemeter"
require "chef_apply/telemeter/patch"
require "chef_apply/log"
require "chef_apply/version"

module ChefApply
  class Telemeter
    class Sender
      attr_reader :session_files

      def self.start_upload_thread
        # Find the files before we spawn the thread - otherwise
        # we may accidentally pick up the current run's session file if it
        # finishes before the thread scans for new files
        session_files = Sender.find_session_files
        sender = Sender.new(session_files)
        Thread.new { sender.run }
      end

      def self.find_session_files
        ChefApply::Log.info("Looking for telemetry data to submit")
        session_search = File.join(ChefApply::Config.telemetry_path, "telemetry-payload-*.yml")
        session_files = Dir.glob(session_search)
        ChefApply::Log.info("Found #{session_files.length} sessions to submit")
        session_files
      end

      def initialize(session_files)
        @session_files = session_files
      end

      def run
        if ChefApply::Telemeter.enabled?
          ChefApply::Log.info("Telemetry enabled, beginning upload of previous session(s)")
          # dev mode telemetry gets sent to a different location
          if ChefApply::Config.telemetry.dev
            ENV["CHEF_TELEMETRY_ENDPOINT"] ||= "https://telemetry-acceptance.chef.io"
          end
          session_files.each { |path| process_session(path) }
        else
          # If telemetry is not enabled, just clean up and return. Even though
          # the telemetry gem will not send if disabled, log output saying that we're submitting
          # it when it has been disabled can be alarming.
          ChefApply::Log.info("Telemetry disabled, clearing any existing session captures without sending them.")
          session_files.each { |path| FileUtils.rm_rf(path) }
        end
        FileUtils.rm_rf(ChefApply::Config.telemetry_session_file)
        ChefApply::Log.info("Terminating, nothing more to do.")
      rescue => e
        ChefApply::Log.fatal "Sender thread aborted: '#{e}' failed at  #{e.backtrace[0]}"
      end

      def process_session(path)
        ChefApply::Log.info("Processing telemetry entries from #{path}")
        content = load_and_clear_session(path)
        submit_session(content)
      end

      def submit_session(content)
        # Each file contains the actions taken within a single run of the chef tool.
        # Each run is one session, so we'll first remove remove the session file
        # to force creating a new one.
        FileUtils.rm_rf(ChefApply::Config.telemetry_session_file)
        # We'll use the version captured in the sesion file
        entries = content["entries"]
        cli_version = content["version"]
        total = entries.length
        telemetry = Telemetry.new(product: "chef-workstation",
                                  origin: "command-line",
                                  product_version: cli_version,
                                  install_context: "omnibus")
        total = entries.length
        entries.each_with_index do |entry, x|
          submit_entry(telemetry, entry, x + 1, total)
        end
      end

      def submit_entry(telemetry, entry, sequence, total)
        ChefApply::Log.info("Submitting telemetry entry #{sequence}/#{total}: #{entry} ")
        telemetry.deliver(entry)
        ChefApply::Log.info("Entry #{sequence}/#{total} submitted.")
      rescue => e
        # No error handling in telemetry lib, so at least track the failrue
        ChefApply::Log.error("Failed to send entry #{sequence}/#{total}: #{e}")
        ChefApply::Log.error("Backtrace: #{e.backtrace} ")
      end

      private

      def load_and_clear_session(path)
        content = File.read(path)
        # We'll remove it now instead of after we parse or submit it -
        # if we fail to deliver, we don't want to be stuck resubmitting it if the problem
        # was due to payload. This is a trade-off - if we get a transient error, the
        # payload will be lost.
        # TODO: Improve error handling so we can intelligently decide whether to
        #       retry a failed load or failed submit.
        FileUtils.rm_rf(path)
        YAML.load(content)
      end
    end
  end
end
