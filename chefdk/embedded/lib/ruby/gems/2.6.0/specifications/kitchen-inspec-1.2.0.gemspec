# -*- encoding: utf-8 -*-
# stub: kitchen-inspec 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kitchen-inspec".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software, Inc.".freeze]
  s.date = "2019-06-06"
  s.description = "A Test Kitchen Verifier for InSpec".freeze
  s.email = ["info@chef.io".freeze]
  s.homepage = "https://github.com/inspec/kitchen-inspec".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Test Kitchen Verifier for InSpec".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<inspec>.freeze, [">= 1.47", "< 5.0"])
      s.add_runtime_dependency(%q<test-kitchen>.freeze, [">= 1.6", "< 3"])
      s.add_runtime_dependency(%q<hashie>.freeze, ["~> 3.4"])
    else
      s.add_dependency(%q<inspec>.freeze, [">= 1.47", "< 5.0"])
      s.add_dependency(%q<test-kitchen>.freeze, [">= 1.6", "< 3"])
      s.add_dependency(%q<hashie>.freeze, ["~> 3.4"])
    end
  else
    s.add_dependency(%q<inspec>.freeze, [">= 1.47", "< 5.0"])
    s.add_dependency(%q<test-kitchen>.freeze, [">= 1.6", "< 3"])
    s.add_dependency(%q<hashie>.freeze, ["~> 3.4"])
  end
end
