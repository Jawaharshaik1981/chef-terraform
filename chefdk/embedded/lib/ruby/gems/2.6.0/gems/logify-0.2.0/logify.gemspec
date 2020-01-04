# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logify/version'

Gem::Specification.new do |spec|
  spec.name          = 'logify'
  spec.version       = Logify::VERSION
  spec.authors       = ['Seth Vargo']
  spec.email         = ['sethvargo@gmail.com']
  spec.summary       = 'Logify is a lightweight logging library for Ruby!'
  spec.description   = 'Logify is an incredibly light-weight Ruby logger ' \
                        'with a developer-friendly API and no dependencies. ' \
                        'It is intentionally very opinionated and is ' \
                        'optimized for speed. This combination makes it ' \
                        'perfect for command line applications.'

  spec.homepage      = 'https://github.com/sethvargo/logify'
  spec.license       = 'Apache 2.0'

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Development dependencies
  spec.add_development_dependency 'rspec', '~> 2.14'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'ruby-prof'
end
