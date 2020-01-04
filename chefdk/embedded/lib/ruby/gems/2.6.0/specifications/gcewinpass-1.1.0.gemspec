# -*- encoding: utf-8 -*-
# stub: gcewinpass 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gcewinpass".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Partner Engineering".freeze]
  s.date = "2017-12-11"
  s.description = "Reset a password on a Google Compute Engine instance running Windows.".freeze
  s.email = ["partnereng@chef.io".freeze]
  s.homepage = "https://github.com/chef-partners/gcewinpass".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Reset a password on a Google Compute Engine instance running Windows.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<google-api-client>.freeze, ["~> 0.13"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
      s.add_development_dependency(%q<chefstyle>.freeze, ["= 0.3.1"])
    else
      s.add_dependency(%q<google-api-client>.freeze, ["~> 0.13"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
      s.add_dependency(%q<chefstyle>.freeze, ["= 0.3.1"])
    end
  else
    s.add_dependency(%q<google-api-client>.freeze, ["~> 0.13"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
    s.add_dependency(%q<chefstyle>.freeze, ["= 0.3.1"])
  end
end
