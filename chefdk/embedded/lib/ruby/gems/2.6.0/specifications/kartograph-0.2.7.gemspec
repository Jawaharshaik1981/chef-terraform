# -*- encoding: utf-8 -*-
# stub: kartograph 0.2.7 ruby lib

Gem::Specification.new do |s|
  s.name = "kartograph".freeze
  s.version = "0.2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robert Ross".freeze]
  s.date = "2018-02-02"
  s.description = "Kartograph makes it easy to generate and convert JSON. It's intention is to be used for API clients.".freeze
  s.email = ["engineering@digitalocean.com".freeze, "rross@digitalocean.com".freeze, "ivan@digitalocean.com".freeze]
  s.homepage = "https://github.com/digitaloceancloud/kartograph".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Kartograph makes it easy to generate and convert JSON. It's intention is to be used for API clients.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["< 11.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
