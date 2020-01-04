# -*- encoding: utf-8 -*-
# stub: appbundler 0.13.1 ruby lib

Gem::Specification.new do |s|
  s.name = "appbundler".freeze
  s.version = "0.13.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software, Inc.".freeze]
  s.date = "2019-10-15"
  s.description = "Extracts a dependency solution from bundler's Gemfile.lock to speed gem activation".freeze
  s.email = ["info@chef.io".freeze]
  s.executables = ["appbundler".freeze]
  s.files = ["bin/appbundler".freeze]
  s.homepage = "https://github.com/chef/appbundler".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Extracts a dependency solution from bundler's Gemfile.lock to speed gem activation".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mixlib-shellout>.freeze, [">= 2.0", "< 4.0"])
      s.add_runtime_dependency(%q<mixlib-cli>.freeze, [">= 1.4", "< 3.0"])
    else
      s.add_dependency(%q<mixlib-shellout>.freeze, [">= 2.0", "< 4.0"])
      s.add_dependency(%q<mixlib-cli>.freeze, [">= 1.4", "< 3.0"])
    end
  else
    s.add_dependency(%q<mixlib-shellout>.freeze, [">= 2.0", "< 4.0"])
    s.add_dependency(%q<mixlib-cli>.freeze, [">= 1.4", "< 3.0"])
  end
end
