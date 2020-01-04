# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "train-habitat/version"

Gem::Specification.new do |spec|
  spec.name        = "train-habitat"
  spec.version     = TrainPlugins::Habitat::VERSION
  spec.authors     = ["Chef InSpec Team"]
  spec.email       = ["inspec@chef.io"]
  spec.summary     = "Habitat API Transport for Train"
  spec.description = "Allows applications using Train to speak to Habitat."
  spec.homepage    = "https://github.com/inspec/train-habitat"
  spec.license     = "Apache-2.0"

  spec.files = %w{
    README.md train-habitat.gemspec Gemfile
  } + Dir.glob(
    "lib/**/*", File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
