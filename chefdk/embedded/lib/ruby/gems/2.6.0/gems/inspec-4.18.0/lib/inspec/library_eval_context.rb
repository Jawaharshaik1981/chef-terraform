require "inspec/plugin/v1/plugin_types/resource"
require "inspec/dsl_shared"

module Inspec
  #
  # LibaryEvalContext constructs an instance of an anonymous class
  # that library files will be instance_exec'd against.
  #
  # The anonymous class ensures that `Inspec.resource(1)` will return
  # an anonymouse class that is suitable as the parent class of an
  # inspec resource. The class returned will have the resource
  # registry used by all dsl methods bound to the resource registry
  # passed into the #create constructor.
  #
  #
  class LibraryEvalContext
    def self.create(registry, require_loader)
      c = Class.new do
        extend Inspec::ResourceDSL
        include Inspec::ResourceBehaviors
        define_singleton_method :__resource_registry do
          registry
        end
      end

      c2 = Class.new do
        define_singleton_method :resource do |version|
          Inspec.validate_resource_dsl_version!(version)
          c
        end
      end

      c3 = Class.new do
        include Inspec::DSL::RequireOverride
        def initialize(require_loader)
          @require_loader = require_loader
          @inspec_binding = nil
        end

        def __inspec_binding
          @inspec_binding
        end
      end

      c3.const_set(:Inspec, c2)
      res = c3.new(require_loader)

      # Provide the local binding for this context which is necessary for
      # calls to `require` to create all dependent objects in the correct
      # context.
      res.instance_variable_set("@inspec_binding", res.instance_eval("binding"))
      res
    end
  end
end
