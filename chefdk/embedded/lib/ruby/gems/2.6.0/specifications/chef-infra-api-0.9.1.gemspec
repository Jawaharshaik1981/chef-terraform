# -*- encoding: utf-8 -*-
# stub: chef-infra-api 0.9.1 ruby lib

Gem::Specification.new do |s|
  s.name = "chef-infra-api".freeze
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Seth Vargo".freeze, "Tim Smith".freeze]
  s.date = "2019-09-19"
  s.description = "A tiny Chef API client with minimal dependencies".freeze
  s.email = ["sethvargo@gmail.com".freeze, "tsmith84@gmail.com".freeze]
  s.homepage = "https://github.com/chef/chef-api".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Chef API client in Ruby".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logify>.freeze, ["~> 0.1"])
      s.add_runtime_dependency(%q<mime-types>.freeze, [">= 0"])
    else
      s.add_dependency(%q<logify>.freeze, ["~> 0.1"])
      s.add_dependency(%q<mime-types>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<logify>.freeze, ["~> 0.1"])
    s.add_dependency(%q<mime-types>.freeze, [">= 0"])
  end
end
