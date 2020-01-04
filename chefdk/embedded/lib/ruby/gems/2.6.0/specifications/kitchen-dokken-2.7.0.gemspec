# -*- encoding: utf-8 -*-
# stub: kitchen-dokken 2.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kitchen-dokken".freeze
  s.version = "2.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sean OMeara".freeze]
  s.date = "2019-05-29"
  s.description = "A Test Kitchen Driver for Dokken".freeze
  s.email = ["sean@sean.io".freeze]
  s.homepage = "https://github.com/someara/kitchen-dokken".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Test Kitchen Driver that talks to the Docker Remote API and uses Volumes to produce sparse container images".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<docker-api>.freeze, ["~> 1.33"])
      s.add_runtime_dependency(%q<lockfile>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<test-kitchen>.freeze, [">= 1.15", "< 3"])
    else
      s.add_dependency(%q<docker-api>.freeze, ["~> 1.33"])
      s.add_dependency(%q<lockfile>.freeze, ["~> 2.1"])
      s.add_dependency(%q<test-kitchen>.freeze, [">= 1.15", "< 3"])
    end
  else
    s.add_dependency(%q<docker-api>.freeze, ["~> 1.33"])
    s.add_dependency(%q<lockfile>.freeze, ["~> 2.1"])
    s.add_dependency(%q<test-kitchen>.freeze, [">= 1.15", "< 3"])
  end
end
