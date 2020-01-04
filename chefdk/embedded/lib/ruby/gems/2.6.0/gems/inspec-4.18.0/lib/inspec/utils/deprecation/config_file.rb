require "stringio"
require "json"
require "inspec/globals"

module Inspec
  module Deprecation
    class ConfigFile
      GroupEntry = Struct.new(:name, :action, :prefix, :suffix, :exit_status)

      # What actions may you specify to be taken when a deprecation is encountered?
      VALID_ACTIONS = [
        :exit, # Hard exit `inspec`, no stacktrace, exit code specified or Inspec::UI::EXIT_FATAL_DEPRECATION
        :fail_control, # Fail the control with a message. If not in a control, do :warn action instead.
        :ignore, # Do nothing.
        :warn, # Issue a warning
      ].freeze

      # Note that 'comment' is ignored, but listed here so you can have it present
      # and pass validation.
      VALID_GROUP_FIELDS = %w{action suffix prefix exit_status comment}.freeze

      attr_reader :groups, :unknown_group_action

      def initialize(io = nil)
        io ||= open_default_config_io
        begin
          @raw_data = JSON.parse(io.read)
        rescue JSON::ParserError => e
          raise Inspec::Deprecation::MalformedConfigFileError, "Could not parse deprecation config file: #{e.message}"
        end

        @groups = {}
        @unknown_group_action = :warn
        validate!
      end

      private

      def open_default_config_io
        default_path = File.join(Inspec.src_root, "etc", "deprecations.json")
        unless File.exist?(default_path)
          raise Inspec::Deprecation::MalformedConfigError, "Missing deprecation config file: #{default_path}"
        end

        File.open(default_path)
      end

      #====================================================================================================#
      #                                          Validation
      #====================================================================================================#
      def validate!
        validate_file_version
        validate_unknown_group_action

        unless @raw_data.key?("groups")
          raise Inspec::Deprecation::InvalidConfigFileError, "Missing groups field"
        end
        unless @raw_data["groups"].is_a?(Hash)
          raise Inspec::Deprecation::InvalidConfigFileError, "Groups field must be a Hash"
        end

        @raw_data["groups"].each do |group_name, group_info|
          validate_group_entry(group_name, group_info)
        end
      end

      def validate_file_version
        unless @raw_data.key?("file_version")
          raise Inspec::Deprecation::InvalidConfigFileError, "Missing file_version field"
        end
        unless @raw_data["file_version"] == "1.0.0"
          raise Inspec::Deprecation::InvalidConfigFileError, "Unrecognized file_version '#{@raw_data["file_version"]}' - supported versions: 1.0.0"
        end
      end

      def validate_unknown_group_action
        seen_action = (@raw_data["unknown_group_action"] || @unknown_group_action).to_sym
        unless VALID_ACTIONS.include?(seen_action)
          raise Inspec::Deprecation::UnrecognizedActionError, "Unrecognized value '#{seen_action}' for field 'unknown_group_action' - supported actions: #{VALID_ACTIONS.map(&:to_s).join(", ")}"
        end

        @unknown_group_action = seen_action
      end

      def validate_group_entry(name, opts)
        opts.each do |seen_field, _value|
          unless VALID_GROUP_FIELDS.include?(seen_field)
            raise Inspec::Deprecation::InvalidConfigFileError, "Unrecognized field for group '#{name}' - saw '#{seen_field}', supported fields: #{VALID_GROUP_FIELDS.map(&:to_s).join(", ")}"
          end
        end

        entry = GroupEntry.new(name.to_sym)

        opts["action"] = (opts["action"] || :warn).to_sym
        unless VALID_ACTIONS.include?(opts["action"])
          raise Inspec::Deprecation::UnrecognizedActionError, "Unrecognized action for group '#{name}' - saw '#{opts["action"]}', supported actions: #{VALID_ACTIONS.map(&:to_s).join(", ")}"
        end

        entry.action = opts["action"]

        entry.suffix = opts["suffix"]
        entry.prefix = opts["prefix"]
        entry.exit_status = opts["exit_status"]

        groups[name.to_sym] = entry
      end
    end
  end
end
