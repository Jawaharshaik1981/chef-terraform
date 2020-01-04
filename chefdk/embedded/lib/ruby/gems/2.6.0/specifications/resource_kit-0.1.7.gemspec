# -*- encoding: utf-8 -*-
# stub: resource_kit 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "resource_kit".freeze
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robert Ross".freeze, "Ivan Vanderbyl".freeze]
  s.date = "2017-09-26"
  s.description = "".freeze
  s.email = ["engineering@digitalocean.com".freeze, "rross@digitalocean.com".freeze, "ivan@digitalocean.com".freeze]
  s.homepage = "https://github.com/digitaloceancloud/resource_kit".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Resource Kit provides tools to aid in making API Clients. Such as URL resolving, Request / Response layer, and more.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>.freeze, ["< 3.0.0", ">= 2.3.6"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.18.0"])
      s.add_development_dependency(%q<kartograph>.freeze, ["~> 0.0.8"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.10.1"])
    else
      s.add_dependency(%q<addressable>.freeze, ["< 3.0.0", ">= 2.3.6"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.18.0"])
      s.add_dependency(%q<kartograph>.freeze, ["~> 0.0.8"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.10.1"])
    end
  else
    s.add_dependency(%q<addressable>.freeze, ["< 3.0.0", ">= 2.3.6"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.18.0"])
    s.add_dependency(%q<kartograph>.freeze, ["~> 0.0.8"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10.1"])
  end
end
