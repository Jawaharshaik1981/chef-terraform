module Inspec::Plugin::V2::PluginType
  class Input < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:input)

    #====================================================================#
    #                         Input plugin type API
    #====================================================================#
    # Implementation classes must implement these methods.

    # When an input is obtained from the plugin, this number determines what
    # precedence to assign to the input.
    # @return Integer range 0-100. Higher priority means higher precedence
    def default_priority
      60
    end

    # Indicates an attempt is being made to read the value for an input.
    # Return nil if the input is not supplied by the plugin, otherwise
    # return the value.
    # @return Object or nil
    def fetch(_profile_name, _input_name)
      raise NotImplementedError, "Plugin #{plugin_name} must implement the #fetch method"
    end

    # Given a profile name, list all input names for which the plugin
    # would offer a response.
    # @param String profile_name Name of the profile
    # @return Array[String] List of input names for which the plugin
    # would offer a response.
    def list_inputs(_profile)
      raise NotImplementedError, "Plugin #{plugin_name} must implement the #list_inputs method"
    end
  end
end
