# -*- encoding: utf-8 -*-
# stub: inspec-core 4.17.17 ruby lib

Gem::Specification.new do |s|
  s.name = "inspec-core".freeze
  s.version = "4.17.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dominik Richter".freeze]
  s.date = "2019-10-02"
  s.description = "Core InSpec, local support only. See `inspec` for full support.".freeze
  s.email = ["dominik.richter@gmail.com".freeze]
  s.homepage = "https://github.com/chef/inspec".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Just InSpec".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<train-core>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<license-acceptance>.freeze, [">= 0.2.13", "< 2.0"])
      s.add_runtime_dependency(%q<thor>.freeze, ["~> 0.20"])
      s.add_runtime_dependency(%q<json-schema>.freeze, ["~> 2.8"])
      s.add_runtime_dependency(%q<method_source>.freeze, ["~> 0.8"])
      s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_runtime_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<hashie>.freeze, ["~> 3.4"])
      s.add_runtime_dependency(%q<mixlib-log>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_runtime_dependency(%q<sslshake>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<parallel>.freeze, ["~> 1.9"])
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0.9.0"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 0.12.2"])
      s.add_runtime_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.4"])
      s.add_runtime_dependency(%q<parslet>.freeze, ["~> 1.5"])
      s.add_runtime_dependency(%q<semverse>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<htmlentities>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<multipart-post>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<tty-table>.freeze, ["~> 0.10"])
      s.add_runtime_dependency(%q<tty-prompt>.freeze, ["~> 0.17"])
      s.add_runtime_dependency(%q<term-ansicolor>.freeze, [">= 0"])
    else
      s.add_dependency(%q<train-core>.freeze, ["~> 3.0"])
      s.add_dependency(%q<license-acceptance>.freeze, [">= 0.2.13", "< 2.0"])
      s.add_dependency(%q<thor>.freeze, ["~> 0.20"])
      s.add_dependency(%q<json-schema>.freeze, ["~> 2.8"])
      s.add_dependency(%q<method_source>.freeze, ["~> 0.8"])
      s.add_dependency(%q<rubyzip>.freeze, ["~> 1.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_dependency(%q<hashie>.freeze, ["~> 3.4"])
      s.add_dependency(%q<mixlib-log>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_dependency(%q<sslshake>.freeze, ["~> 1.2"])
      s.add_dependency(%q<parallel>.freeze, ["~> 1.9"])
      s.add_dependency(%q<faraday>.freeze, [">= 0.9.0"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.12.2"])
      s.add_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.4"])
      s.add_dependency(%q<parslet>.freeze, ["~> 1.5"])
      s.add_dependency(%q<semverse>.freeze, [">= 0"])
      s.add_dependency(%q<htmlentities>.freeze, [">= 0"])
      s.add_dependency(%q<multipart-post>.freeze, [">= 0"])
      s.add_dependency(%q<tty-table>.freeze, ["~> 0.10"])
      s.add_dependency(%q<tty-prompt>.freeze, ["~> 0.17"])
      s.add_dependency(%q<term-ansicolor>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<train-core>.freeze, ["~> 3.0"])
    s.add_dependency(%q<license-acceptance>.freeze, [">= 0.2.13", "< 2.0"])
    s.add_dependency(%q<thor>.freeze, ["~> 0.20"])
    s.add_dependency(%q<json-schema>.freeze, ["~> 2.8"])
    s.add_dependency(%q<method_source>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rubyzip>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
    s.add_dependency(%q<hashie>.freeze, ["~> 3.4"])
    s.add_dependency(%q<mixlib-log>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0"])
    s.add_dependency(%q<sslshake>.freeze, ["~> 1.2"])
    s.add_dependency(%q<parallel>.freeze, ["~> 1.9"])
    s.add_dependency(%q<faraday>.freeze, [">= 0.9.0"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.12.2"])
    s.add_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.4"])
    s.add_dependency(%q<parslet>.freeze, ["~> 1.5"])
    s.add_dependency(%q<semverse>.freeze, [">= 0"])
    s.add_dependency(%q<htmlentities>.freeze, [">= 0"])
    s.add_dependency(%q<multipart-post>.freeze, [">= 0"])
    s.add_dependency(%q<tty-table>.freeze, ["~> 0.10"])
    s.add_dependency(%q<tty-prompt>.freeze, ["~> 0.17"])
    s.add_dependency(%q<term-ansicolor>.freeze, [">= 0"])
  end
end
