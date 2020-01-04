# -*- encoding: utf-8 -*-
# stub: knife-azure 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "knife-azure".freeze
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Barry Davis".freeze, "Chirag Jog".freeze]
  s.date = "2019-09-10"
  s.description = "A plugin to the Chef knife tool for creating instances on the Microsoft Azure platform".freeze
  s.email = "oss@chef.io".freeze
  s.extra_rdoc_files = ["LICENSE".freeze]
  s.files = ["LICENSE".freeze]
  s.homepage = "https://github.com/chef/knife-azure".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A plugin to the Chef knife tool for creating instances on the Microsoft Azure platform".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>.freeze, [">= 15.1"])
      s.add_runtime_dependency(%q<chef-bin>.freeze, [">= 15.1"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.5.5"])
      s.add_runtime_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.17", ">= 0.17.2"])
      s.add_runtime_dependency(%q<azure_mgmt_compute>.freeze, ["~> 0.18", ">= 0.18.3"])
      s.add_runtime_dependency(%q<azure_mgmt_storage>.freeze, ["~> 0.17", ">= 0.17.3"])
      s.add_runtime_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.18", ">= 0.18.2"])
      s.add_runtime_dependency(%q<listen>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<ipaddress>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<ffi>.freeze, [">= 0"])
    else
      s.add_dependency(%q<chef>.freeze, [">= 15.1"])
      s.add_dependency(%q<chef-bin>.freeze, [">= 15.1"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 1.5.5"])
      s.add_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.17", ">= 0.17.2"])
      s.add_dependency(%q<azure_mgmt_compute>.freeze, ["~> 0.18", ">= 0.18.3"])
      s.add_dependency(%q<azure_mgmt_storage>.freeze, ["~> 0.17", ">= 0.17.3"])
      s.add_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.18", ">= 0.18.2"])
      s.add_dependency(%q<listen>.freeze, ["~> 3.1"])
      s.add_dependency(%q<ipaddress>.freeze, [">= 0"])
      s.add_dependency(%q<ffi>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<chef>.freeze, [">= 15.1"])
    s.add_dependency(%q<chef-bin>.freeze, [">= 15.1"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.5.5"])
    s.add_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.17", ">= 0.17.2"])
    s.add_dependency(%q<azure_mgmt_compute>.freeze, ["~> 0.18", ">= 0.18.3"])
    s.add_dependency(%q<azure_mgmt_storage>.freeze, ["~> 0.17", ">= 0.17.3"])
    s.add_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.18", ">= 0.18.2"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.1"])
    s.add_dependency(%q<ipaddress>.freeze, [">= 0"])
    s.add_dependency(%q<ffi>.freeze, [">= 0"])
  end
end
