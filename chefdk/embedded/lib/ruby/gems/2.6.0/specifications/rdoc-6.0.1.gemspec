# -*- encoding: utf-8 -*-
# stub: rdoc 6.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rdoc".freeze
  s.version = "6.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 2.2".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Eric Hodel".freeze, "Dave Thomas".freeze, "Phil Hagelberg".freeze, "Tony Strauss".freeze, "Zachary Scott".freeze, "Hiroshi SHIBATA".freeze, "ITOYANAGI Sakura".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-12-24"
  s.description = "RDoc produces HTML and command-line documentation for Ruby projects.\nRDoc includes the +rdoc+ and +ri+ tools for generating and displaying documentation from the command-line.\n".freeze
  s.email = ["drbrain@segment7.net".freeze, "".freeze, "".freeze, "".freeze, "mail@zzak.io".freeze, "hsbt@ruby-lang.org".freeze, "aycabta@gmail.com".freeze]
  s.executables = ["rdoc".freeze, "ri".freeze]
  s.extra_rdoc_files = ["CVE-2013-0256.rdoc".freeze, "CONTRIBUTING.rdoc".freeze, "ExampleMarkdown.md".freeze, "ExampleRDoc.rdoc".freeze, "History.rdoc".freeze, "LEGAL.rdoc".freeze, "LICENSE.rdoc".freeze, "README.rdoc".freeze, "RI.rdoc".freeze, "TODO.rdoc".freeze]
  s.files = ["CONTRIBUTING.rdoc".freeze, "CVE-2013-0256.rdoc".freeze, "ExampleMarkdown.md".freeze, "ExampleRDoc.rdoc".freeze, "History.rdoc".freeze, "LEGAL.rdoc".freeze, "LICENSE.rdoc".freeze, "README.rdoc".freeze, "RI.rdoc".freeze, "TODO.rdoc".freeze, "exe/rdoc".freeze, "exe/ri".freeze]
  s.homepage = "https://ruby.github.io/rdoc".freeze
  s.licenses = ["Ruby".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "RDoc produces HTML and command-line documentation for Ruby projects".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<racc>.freeze, ["> 1.4.10"])
      s.add_development_dependency(%q<kpeg>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 4"])
      s.add_development_dependency(%q<json>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<racc>.freeze, ["> 1.4.10"])
      s.add_dependency(%q<kpeg>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 4"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<racc>.freeze, ["> 1.4.10"])
    s.add_dependency(%q<kpeg>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 4"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
  end
end
