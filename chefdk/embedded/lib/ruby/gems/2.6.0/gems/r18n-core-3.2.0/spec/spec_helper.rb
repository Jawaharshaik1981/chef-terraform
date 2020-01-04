# frozen_string_literal: true

## https://github.com/stevekinney/pizza/issues/103#issuecomment-136052789
## https://github.com/docker-library/ruby/issues/45
Encoding.default_external = 'UTF-8'

require 'pp'

require_relative '../lib/r18n-core'
Dir.glob(File.join(__dir__, '..', 'locales', '*.rb')) do |locale_file|
  require locale_file
end

TRANSLATIONS = File.join(__dir__, 'translations') unless defined? TRANSLATIONS
DIR = File.join(TRANSLATIONS, 'general') unless defined? DIR
TWO = File.join(TRANSLATIONS, 'two')     unless defined? TWO
unless defined? EXT
  EXT = R18n::Loader::YAML.new(File.join(TRANSLATIONS, 'extension'))
end

RSpec.configure do |config|
  config.before { R18n.clear_cache! }
end

gem 'kramdown'
gem 'RedCloth'

class CounterLoader
  attr_reader :available
  attr_reader :loaded

  def initialize(*available)
    @available = available.map { |i| R18n.locale(i) }
    @loaded = 0
  end

  def load(_locale)
    @loaded += 1
    {}
  end

  def hash
    @available.hash
  end
end
