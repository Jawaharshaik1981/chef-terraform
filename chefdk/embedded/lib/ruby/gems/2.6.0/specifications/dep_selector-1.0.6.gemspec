# -*- encoding: utf-8 -*-
# stub: dep_selector 1.0.6 ruby lib
# stub: ext/dep_gecode/extconf.rb

Gem::Specification.new do |s|
  s.name = "dep_selector".freeze
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Christopher Walters".freeze, "Mark Anderson".freeze]
  s.date = "2017-08-17"
  s.description = "Given packages, versions, and a dependency graph, find a valid assignment of package versions".freeze
  s.email = ["dev@getchef.com".freeze]
  s.extensions = ["ext/dep_gecode/extconf.rb".freeze]
  s.files = ["ext/dep_gecode/extconf.rb".freeze]
  s.homepage = "http://github.com/opscode/dep-selector".freeze
  s.licenses = ["Apache v2".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.requirements = ["gecode, version 3.5 or greater".freeze, "g++".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Given packages, versions, and a dependency graph, find a valid assignment of package versions".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.9"])
      s.add_runtime_dependency(%q<dep-selector-libgecode>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_development_dependency(%q<solve>.freeze, ["~> 0.8"])
    else
      s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
      s.add_dependency(%q<dep-selector-libgecode>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_dependency(%q<solve>.freeze, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
    s.add_dependency(%q<dep-selector-libgecode>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
    s.add_dependency(%q<solve>.freeze, ["~> 0.8"])
  end
end
