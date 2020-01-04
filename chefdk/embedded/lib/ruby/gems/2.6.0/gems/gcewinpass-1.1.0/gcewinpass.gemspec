# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'gcewinpass/version'

Gem::Specification.new do |spec|
  spec.name          = 'gcewinpass'
  spec.version       = GoogleComputeWindowsPassword::VERSION
  spec.authors       = ['Chef Partner Engineering']
  spec.email         = ['partnereng@chef.io']

  spec.summary       = 'Reset a password on a Google Compute Engine instance running Windows.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/chef-partners/gcewinpass'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'google-api-client', '~> 0.13'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.4'
  spec.add_development_dependency 'pry',     '~> 0.10'
  spec.add_development_dependency 'chefstyle', '0.3.1'
end
