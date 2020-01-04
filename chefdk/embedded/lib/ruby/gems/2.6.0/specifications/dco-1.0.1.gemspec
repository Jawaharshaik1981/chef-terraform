# -*- encoding: utf-8 -*-
# stub: dco 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dco".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Noah Kantrowitz".freeze]
  s.date = "2016-10-18"
  s.description = "A command line tool to help manage Developer Certificate of Origin projects.".freeze
  s.email = ["noah@coderanger.net".freeze]
  s.executables = ["dco".freeze]
  s.files = ["bin/dco".freeze]
  s.homepage = "https://github.com/coderanger/dco".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A command line tool to help manage Developer Certificate of Origin projects.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<git>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<thor>.freeze, ["~> 0.19"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 11.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<rspec-command>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<fuubar>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<codecov>.freeze, ["~> 0.0", ">= 0.0.2"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    else
      s.add_dependency(%q<git>.freeze, ["~> 1.3"])
      s.add_dependency(%q<thor>.freeze, ["~> 0.19"])
      s.add_dependency(%q<rake>.freeze, ["~> 11.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_dependency(%q<rspec-command>.freeze, ["~> 1.0"])
      s.add_dependency(%q<fuubar>.freeze, ["~> 2.0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<codecov>.freeze, ["~> 0.0", ">= 0.0.2"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<git>.freeze, ["~> 1.3"])
    s.add_dependency(%q<thor>.freeze, ["~> 0.19"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<rspec-command>.freeze, ["~> 1.0"])
    s.add_dependency(%q<fuubar>.freeze, ["~> 2.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<codecov>.freeze, ["~> 0.0", ">= 0.0.2"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
