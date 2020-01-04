# -*- encoding: utf-8 -*-
# stub: inspec-core-bin 4.17.17 ruby lib

Gem::Specification.new do |s|
  s.name = "inspec-core-bin".freeze
  s.version = "4.17.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef InSpec Core Engineering ".freeze]
  s.date = "2019-10-02"
  s.description = "InSpec executable for inspec-core gem. Use of this executable may require accepting a license agreement.".freeze
  s.email = ["inspec@chef.io".freeze]
  s.executables = ["inspec".freeze]
  s.files = ["bin/inspec".freeze]
  s.homepage = "https://github.com/inspec/inspec/tree/master/inspec-bin".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Infrastructure and compliance testing.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<inspec-core>.freeze, ["= 4.17.17"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<inspec-core>.freeze, ["= 4.17.17"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<inspec-core>.freeze, ["= 4.17.17"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
