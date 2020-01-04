# -*- encoding: utf-8 -*-
# stub: chef-bin 15.4.45 ruby lib

Gem::Specification.new do |s|
  s.name = "chef-bin".freeze
  s.version = "15.4.45"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Jacob".freeze]
  s.date = "2019-10-15"
  s.email = ["adam@chef.io".freeze]
  s.executables = ["chef-apply".freeze, "chef-client".freeze, "chef-resource-inspector".freeze, "chef-service-manager".freeze, "chef-shell".freeze, "chef-solo".freeze, "chef-windows-service".freeze]
  s.files = ["bin/chef-apply".freeze, "bin/chef-client".freeze, "bin/chef-resource-inspector".freeze, "bin/chef-service-manager".freeze, "bin/chef-shell".freeze, "bin/chef-solo".freeze, "bin/chef-windows-service".freeze]
  s.homepage = "https://github.com/chef/chef".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Chef-branded binstubs for chef-client".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>.freeze, ["= 15.4.45"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<chef>.freeze, ["= 15.4.45"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<chef>.freeze, ["= 15.4.45"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
