# -*- encoding: utf-8 -*-
# stub: chef-apply 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "chef-apply".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software, Inc".freeze]
  s.date = "2019-06-04"
  s.description = "Ad-hoc management of individual nodes and devices.".freeze
  s.email = ["workstation@chef.io".freeze]
  s.executables = ["chef-run".freeze]
  s.files = ["bin/chef-run".freeze]
  s.homepage = "https://github.com/chef/chef-apply".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.post_install_message = "Chef Apply is not meant to be installed as a gem. It is meant to be installed\nas part of the Chef Workstation package. Please download and install\nthat from https://downloads.chef.io/chef-workstation/\n".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "The ad-hoc execution tool for the Chef ecosystem.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mixlib-cli>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mixlib-config>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mixlib-log>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mixlib-install>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<r18n-desktop>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<toml-rb>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<train>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<pastel>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<tty-spinner>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<chef>.freeze, [">= 15.0"])
      s.add_runtime_dependency(%q<chef-dk>.freeze, [">= 4.0"])
      s.add_runtime_dependency(%q<chef-telemetry>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<license-acceptance>.freeze, ["~> 1.0", ">= 1.0.11"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    else
      s.add_dependency(%q<mixlib-cli>.freeze, [">= 0"])
      s.add_dependency(%q<mixlib-config>.freeze, [">= 0"])
      s.add_dependency(%q<mixlib-log>.freeze, [">= 0"])
      s.add_dependency(%q<mixlib-install>.freeze, [">= 0"])
      s.add_dependency(%q<r18n-desktop>.freeze, [">= 0"])
      s.add_dependency(%q<toml-rb>.freeze, [">= 0"])
      s.add_dependency(%q<train>.freeze, [">= 0"])
      s.add_dependency(%q<pastel>.freeze, [">= 0"])
      s.add_dependency(%q<tty-spinner>.freeze, [">= 0"])
      s.add_dependency(%q<chef>.freeze, [">= 15.0"])
      s.add_dependency(%q<chef-dk>.freeze, [">= 4.0"])
      s.add_dependency(%q<chef-telemetry>.freeze, [">= 0"])
      s.add_dependency(%q<license-acceptance>.freeze, ["~> 1.0", ">= 1.0.11"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<mixlib-cli>.freeze, [">= 0"])
    s.add_dependency(%q<mixlib-config>.freeze, [">= 0"])
    s.add_dependency(%q<mixlib-log>.freeze, [">= 0"])
    s.add_dependency(%q<mixlib-install>.freeze, [">= 0"])
    s.add_dependency(%q<r18n-desktop>.freeze, [">= 0"])
    s.add_dependency(%q<toml-rb>.freeze, [">= 0"])
    s.add_dependency(%q<train>.freeze, [">= 0"])
    s.add_dependency(%q<pastel>.freeze, [">= 0"])
    s.add_dependency(%q<tty-spinner>.freeze, [">= 0"])
    s.add_dependency(%q<chef>.freeze, [">= 15.0"])
    s.add_dependency(%q<chef-dk>.freeze, [">= 4.0"])
    s.add_dependency(%q<chef-telemetry>.freeze, [">= 0"])
    s.add_dependency(%q<license-acceptance>.freeze, ["~> 1.0", ">= 1.0.11"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
  end
end
