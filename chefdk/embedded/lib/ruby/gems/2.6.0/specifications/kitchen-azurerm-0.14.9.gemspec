# -*- encoding: utf-8 -*-
# stub: kitchen-azurerm 0.14.9 ruby lib

Gem::Specification.new do |s|
  s.name = "kitchen-azurerm".freeze
  s.version = "0.14.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stuart Preston".freeze]
  s.date = "2019-07-30"
  s.description = "Test Kitchen driver for the Microsoft Azure Resource Manager (ARM) API".freeze
  s.email = ["stuart@chef.io".freeze]
  s.homepage = "https://github.com/test-kitchen/kitchen-azurerm".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Test Kitchen driver for Azure Resource Manager.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.18", ">= 0.18.2"])
      s.add_runtime_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.17", ">= 0.17.2"])
      s.add_runtime_dependency(%q<inifile>.freeze, [">= 3.0.0", "~> 3.0"])
      s.add_runtime_dependency(%q<sshkey>.freeze, [">= 1.0.0", "~> 1"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 11.0"])
      s.add_development_dependency(%q<chefstyle>.freeze, [">= 0"])
    else
      s.add_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.18", ">= 0.18.2"])
      s.add_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.17", ">= 0.17.2"])
      s.add_dependency(%q<inifile>.freeze, [">= 3.0.0", "~> 3.0"])
      s.add_dependency(%q<sshkey>.freeze, [">= 1.0.0", "~> 1"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 11.0"])
      s.add_dependency(%q<chefstyle>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.18", ">= 0.18.2"])
    s.add_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.17", ">= 0.17.2"])
    s.add_dependency(%q<inifile>.freeze, [">= 3.0.0", "~> 3.0"])
    s.add_dependency(%q<sshkey>.freeze, [">= 1.0.0", "~> 1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 11.0"])
    s.add_dependency(%q<chefstyle>.freeze, [">= 0"])
  end
end
