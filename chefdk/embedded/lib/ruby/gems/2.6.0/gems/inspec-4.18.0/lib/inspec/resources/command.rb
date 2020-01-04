# copyright: 2015, Vulcano Security GmbH

require "inspec/resource"
require "inspec/resources/platform"
require "inspec/resources/os"

module Inspec::Resources
  class Cmd < Inspec.resource(1)
    name "command"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the command InSpec audit resource to test an arbitrary command that is run on the system."
    example <<~EXAMPLE
      describe command('ls -al /') do
        its('stdout') { should match /bin/ }
        its('stderr') { should eq '' }
        its('exit_status') { should eq 0 }
      end

      command('ls -al /').exist? will return false. Existence of command should be checked this way.
      describe command('ls') do
        it { should exist }
      end
    EXAMPLE

    attr_reader :command

    def initialize(cmd, options = {})
      if cmd.nil?
        raise "InSpec `command` was called with `nil` as the argument. This is not supported. Please provide a valid command instead."
      end

      @command = cmd

      if options[:redact_regex]
        unless options[:redact_regex].is_a?(Regexp)
          # Make sure command is replaced so sensitive output isn't shown
          @command = "ERROR"
          raise Inspec::Exceptions::ResourceFailed,
            "The `redact_regex` option must be a regular expression"
        end
        @redact_regex = options[:redact_regex]
      end
    end

    def result
      @result ||= inspec.backend.run_command(@command)
    end

    def stdout
      result.stdout
    end

    def stderr
      result.stderr
    end

    def exit_status
      result.exit_status.to_i
    end

    def exist? # rubocop:disable Metrics/AbcSize
      # silent for mock resources
      return false if inspec.os.name.nil? || inspec.os.name == "mock"

      if inspec.os.linux?
        res = if inspec.platform.name == "alpine"
                inspec.backend.run_command("which \"#{@command}\"")
              else
                inspec.backend.run_command("bash -c 'type \"#{@command}\"'")
              end
      elsif inspec.os.windows?
        res = inspec.backend.run_command("Get-Command \"#{@command}\"")
      elsif inspec.os.unix?
        res = inspec.backend.run_command("type \"#{@command}\"")
      else
        warn "`command(#{@command}).exist?` is not supported on your OS: #{inspec.os[:name]}"
        return false
      end
      res.exit_status.to_i == 0
    end

    def to_s
      output = "Command: `#{@command}`"
      # Redact output if the `redact_regex` option is passed
      # If no capture groups are passed then `\1` and `\2` are ignored
      output.gsub!(@redact_regex, '\1REDACTED\2') unless @redact_regex.nil?
      output
    end
  end
end
