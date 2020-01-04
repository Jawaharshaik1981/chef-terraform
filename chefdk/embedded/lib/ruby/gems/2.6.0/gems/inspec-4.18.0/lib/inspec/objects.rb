module Inspec
  # TODO: these should be namespaced in Objects
  autoload :Tag, "inspec/objects/tag"
  autoload :Control, "inspec/objects/control"
  autoload :Describe, "inspec/objects/describe"
  autoload :EachLoop, "inspec/objects/each_loop"
  autoload :List, "inspec/objects/list"
  autoload :OrTest, "inspec/objects/or_test"
  autoload :RubyHelper, "inspec/objects/ruby_helper"
  autoload :Test, "inspec/objects/test"
  autoload :Value, "inspec/objects/value"
end

require "inspec/objects/input" # already defined so you can't autoload
