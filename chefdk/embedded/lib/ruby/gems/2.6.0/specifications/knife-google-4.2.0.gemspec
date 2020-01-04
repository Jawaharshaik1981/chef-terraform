# -*- encoding: utf-8 -*-
# stub: knife-google 4.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "knife-google".freeze
  s.version = "4.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chiraq Jog".freeze, "Ranjib Dey".freeze, "James Tucker".freeze, "Paul Rossman".freeze, "Eric Johnson".freeze, "Chef Partner Engineering".freeze]
  s.date = "2019-10-10"
  s.description = "Google Compute Engine Support for Chef's Knife Command".freeze
  s.email = ["paulrossman@google.com".freeze, "partnereng@chef.io".freeze]
  s.homepage = "https://github.com/chef/knife-google".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Google Compute Engine Support for Chef's Knife Command".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<knife-cloud>.freeze, [">= 2.0.0"])
      s.add_runtime_dependency(%q<google-api-client>.freeze, [">= 0.19.8", "< 0.25"])
      s.add_runtime_dependency(%q<gcewinpass>.freeze, ["~> 1.1"])
    else
      s.add_dependency(%q<knife-cloud>.freeze, [">= 2.0.0"])
      s.add_dependency(%q<google-api-client>.freeze, [">= 0.19.8", "< 0.25"])
      s.add_dependency(%q<gcewinpass>.freeze, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<knife-cloud>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<google-api-client>.freeze, [">= 0.19.8", "< 0.25"])
    s.add_dependency(%q<gcewinpass>.freeze, ["~> 1.1"])
  end
end
