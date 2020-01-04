# -*- encoding: utf-8 -*-
# stub: kitchen-digitalocean 0.10.4 ruby lib

Gem::Specification.new do |s|
  s.name = "kitchen-digitalocean".freeze
  s.version = "0.10.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Greg Fitzgerald".freeze]
  s.date = "2019-06-28"
  s.description = "A Test Kitchen Driver for Digital Ocean".freeze
  s.email = ["greg@gregf.org".freeze]
  s.homepage = "https://github.com/test-kitchen/kitchen-digitalocean".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Test Kitchen Driver for Digital Ocean".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<droplet_kit>.freeze, ["~> 2.8"])
      s.add_runtime_dependency(%q<test-kitchen>.freeze, [">= 1.17", "< 3"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<cane>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<countloc>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.8"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.64"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<simplecov-console>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.5"])
    else
      s.add_dependency(%q<droplet_kit>.freeze, ["~> 2.8"])
      s.add_dependency(%q<test-kitchen>.freeze, [">= 1.17", "< 3"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<cane>.freeze, ["~> 3.0"])
      s.add_dependency(%q<countloc>.freeze, ["~> 0.4"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.8"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.64"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_dependency(%q<simplecov-console>.freeze, ["~> 0.2"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<droplet_kit>.freeze, ["~> 2.8"])
    s.add_dependency(%q<test-kitchen>.freeze, [">= 1.17", "< 3"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<cane>.freeze, ["~> 3.0"])
    s.add_dependency(%q<countloc>.freeze, ["~> 0.4"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.8"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.64"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_dependency(%q<simplecov-console>.freeze, ["~> 0.2"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.5"])
  end
end
