# -*- encoding: utf-8 -*-
# stub: droplet_kit 2.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "droplet_kit".freeze
  s.version = "2.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robert Ross".freeze]
  s.date = "2019-03-29"
  s.description = "Droplet Kit is the official Ruby library for DigitalOcean's API".freeze
  s.email = ["rross@digitalocean.com".freeze]
  s.homepage = "https://github.com/digitalocean/droplet_kit".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Droplet Kit is the official Ruby library for DigitalOcean's API".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<virtus>.freeze, ["~> 1.0.3"])
      s.add_runtime_dependency(%q<resource_kit>.freeze, ["~> 0.1.5"])
      s.add_runtime_dependency(%q<kartograph>.freeze, ["~> 0.2.3"])
      s.add_runtime_dependency(%q<activesupport>.freeze, ["> 3.0", "< 6"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.15"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.11.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_development_dependency(%q<sinatra>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.18"])
    else
      s.add_dependency(%q<virtus>.freeze, ["~> 1.0.3"])
      s.add_dependency(%q<resource_kit>.freeze, ["~> 0.1.5"])
      s.add_dependency(%q<kartograph>.freeze, ["~> 0.2.3"])
      s.add_dependency(%q<activesupport>.freeze, ["> 3.0", "< 6"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.15"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.11.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.18"])
    end
  else
    s.add_dependency(%q<virtus>.freeze, ["~> 1.0.3"])
    s.add_dependency(%q<resource_kit>.freeze, ["~> 0.1.5"])
    s.add_dependency(%q<kartograph>.freeze, ["~> 0.2.3"])
    s.add_dependency(%q<activesupport>.freeze, ["> 3.0", "< 6"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.15"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.11.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.18"])
  end
end
