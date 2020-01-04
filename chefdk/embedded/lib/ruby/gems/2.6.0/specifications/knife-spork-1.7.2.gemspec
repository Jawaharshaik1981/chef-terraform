# -*- encoding: utf-8 -*-
# stub: knife-spork 1.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "knife-spork".freeze
  s.version = "1.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jon Cowie".freeze, "Ryn Daniels".freeze]
  s.date = "2018-08-03"
  s.description = "KnifeSpork is a workflow plugin for Chef::Knife which helps multiple developers work on the same Chef Server and repository without treading on each other's toes. This plugin was designed around the workflow used at Etsy, where several people are working on the Chef repository and Chef Server simultaneously.".freeze
  s.email = ["jonlives@gmail.com".freeze, "code@ryn.works".freeze]
  s.homepage = "https://github.com/jonlives/knife-spork".freeze
  s.licenses = ["GPL".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A workflow plugin to help many devs work with the same chef repo/server".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.1.0"])
      s.add_development_dependency(%q<chef-zero>.freeze, [">= 3.2"])
      s.add_runtime_dependency(%q<chef>.freeze, [">= 11.0.0"])
      s.add_runtime_dependency(%q<git>.freeze, [">= 1.2.5"])
      s.add_runtime_dependency(%q<app_conf>.freeze, [">= 0.4.0"])
      s.add_runtime_dependency(%q<diffy>.freeze, [">= 3.0.1"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.1.0"])
      s.add_dependency(%q<chef-zero>.freeze, [">= 3.2"])
      s.add_dependency(%q<chef>.freeze, [">= 11.0.0"])
      s.add_dependency(%q<git>.freeze, [">= 1.2.5"])
      s.add_dependency(%q<app_conf>.freeze, [">= 0.4.0"])
      s.add_dependency(%q<diffy>.freeze, [">= 3.0.1"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<chef-zero>.freeze, [">= 3.2"])
    s.add_dependency(%q<chef>.freeze, [">= 11.0.0"])
    s.add_dependency(%q<git>.freeze, [">= 1.2.5"])
    s.add_dependency(%q<app_conf>.freeze, [">= 0.4.0"])
    s.add_dependency(%q<diffy>.freeze, [">= 3.0.1"])
  end
end
