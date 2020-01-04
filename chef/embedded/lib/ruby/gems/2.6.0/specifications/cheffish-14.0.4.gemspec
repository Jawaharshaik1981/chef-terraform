# -*- encoding: utf-8 -*-
# stub: cheffish 14.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "cheffish".freeze
  s.version = "14.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Keiser".freeze]
  s.date = "2018-11-14"
  s.description = "A library to manipulate Chef in Chef.".freeze
  s.email = "jkeiser@chef.io".freeze
  s.homepage = "https://github.com/chef/cheffish".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A library to manipulate Chef in Chef.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef-zero>.freeze, ["~> 14.0"])
      s.add_runtime_dependency(%q<net-ssh>.freeze, [">= 0"])
    else
      s.add_dependency(%q<chef-zero>.freeze, ["~> 14.0"])
      s.add_dependency(%q<net-ssh>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<chef-zero>.freeze, ["~> 14.0"])
    s.add_dependency(%q<net-ssh>.freeze, [">= 0"])
  end
end
