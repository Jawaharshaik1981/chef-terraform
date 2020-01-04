# -*- encoding: utf-8 -*-
# stub: r18n-desktop 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "r18n-desktop".freeze
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrey Sitnik".freeze]
  s.date = "2018-11-08"
  s.description = "    A i18n tool to translate your desktop application in several languages.\n    It is just a wrapper for R18n core library.\n    It has nice Ruby-style syntax, filters, flexible locales, custom loaders,\n    translation support for any classes, time and number localization, several\n    user language support, agnostic core package with out-of-box support for\n    Rails, Sinatra and desktop applications.\n".freeze
  s.email = "andrey@sitnik.ru".freeze
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/ai/r18n/tree/master/r18n-desktop".freeze
  s.licenses = ["LGPL-3.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A i18n tool to translate your Ruby desktop application.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<r18n-core>.freeze, ["= 3.2.0"])
    else
      s.add_dependency(%q<r18n-core>.freeze, ["= 3.2.0"])
    end
  else
    s.add_dependency(%q<r18n-core>.freeze, ["= 3.2.0"])
  end
end
