# -*- encoding: utf-8 -*-
# stub: knife-vsphere 4.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "knife-vsphere".freeze
  s.version = "4.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ezra Pagel".freeze]
  s.date = "2019-10-10"
  s.description = "VMware vSphere support for Chef Infra's Knife command".freeze
  s.email = "ezra@cpan.org".freeze
  s.homepage = "http://github.com/chef/knife-vsphere".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "VMware vSphere support for Chef Infra's Knife command".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<netaddr>.freeze, ["~> 1.5"])
      s.add_runtime_dependency(%q<rbvmomi>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<filesize>.freeze, ["~> 0.1.1"])
      s.add_runtime_dependency(%q<chef-vault>.freeze, [">= 2.6.0"])
      s.add_runtime_dependency(%q<chef>.freeze, [">= 15.1"])
      s.add_runtime_dependency(%q<chef-bin>.freeze, [">= 15.1"])
    else
      s.add_dependency(%q<netaddr>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rbvmomi>.freeze, ["~> 1.8"])
      s.add_dependency(%q<filesize>.freeze, ["~> 0.1.1"])
      s.add_dependency(%q<chef-vault>.freeze, [">= 2.6.0"])
      s.add_dependency(%q<chef>.freeze, [">= 15.1"])
      s.add_dependency(%q<chef-bin>.freeze, [">= 15.1"])
    end
  else
    s.add_dependency(%q<netaddr>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rbvmomi>.freeze, ["~> 1.8"])
    s.add_dependency(%q<filesize>.freeze, ["~> 0.1.1"])
    s.add_dependency(%q<chef-vault>.freeze, [">= 2.6.0"])
    s.add_dependency(%q<chef>.freeze, [">= 15.1"])
    s.add_dependency(%q<chef-bin>.freeze, [">= 15.1"])
  end
end
