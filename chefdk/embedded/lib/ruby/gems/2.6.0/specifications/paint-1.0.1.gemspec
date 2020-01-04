# -*- encoding: utf-8 -*-
# stub: paint 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "paint".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jan Lelis".freeze]
  s.date = "2016-01-03"
  s.description = "Terminal painter: No string extensions / 256 color support / effect support. Usage: Paint['string', :red, :bright]".freeze
  s.email = "mail@janlelis.de".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze, "CHANGELOG.rdoc".freeze, "MIT-LICENSE.txt".freeze]
  s.files = ["CHANGELOG.rdoc".freeze, "MIT-LICENSE.txt".freeze, "README.rdoc".freeze]
  s.homepage = "https://github.com/janlelis/paint".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.requirements = ["Windows: ansicon (https://github.com/adoxa/ansicon) or ConEmu (http://code.google.com/p/conemu-maximus5)".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Terminal painter!".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_development_dependency(%q<benchmark-ips>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<rainbow>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<term-ansicolor>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<ansi>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<hansi>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<pastel>.freeze, ["~> 0.5"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_dependency(%q<benchmark-ips>.freeze, ["~> 2.3"])
      s.add_dependency(%q<rainbow>.freeze, ["~> 2.0"])
      s.add_dependency(%q<term-ansicolor>.freeze, ["~> 1.3"])
      s.add_dependency(%q<ansi>.freeze, ["~> 1.5"])
      s.add_dependency(%q<hansi>.freeze, ["~> 0.1"])
      s.add_dependency(%q<pastel>.freeze, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
    s.add_dependency(%q<benchmark-ips>.freeze, ["~> 2.3"])
    s.add_dependency(%q<rainbow>.freeze, ["~> 2.0"])
    s.add_dependency(%q<term-ansicolor>.freeze, ["~> 1.3"])
    s.add_dependency(%q<ansi>.freeze, ["~> 1.5"])
    s.add_dependency(%q<hansi>.freeze, ["~> 0.1"])
    s.add_dependency(%q<pastel>.freeze, ["~> 0.5"])
  end
end
