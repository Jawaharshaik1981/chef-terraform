require "inspec/plugin/v1"

module Inspec
  SecretsBackend = PluginRegistry.new

  def self.secrets(version)
    if version != 1
      raise "Only secrets version 1 is supported!"
    end

    Inspec::Plugins::Secret
  end
end

require "inspec/secrets/yaml"
