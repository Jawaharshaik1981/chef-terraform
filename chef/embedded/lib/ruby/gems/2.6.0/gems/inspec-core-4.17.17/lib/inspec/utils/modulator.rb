module Modulator
  def modules
    @modules ||= {}
  end

  def add_module(name, handler)
    modules[name] = handler
  end
end
