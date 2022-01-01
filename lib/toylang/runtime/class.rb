# frozen_string_literal: true

class ToyLangClass < ToyLangObject
  attr_reader :runtime_methods

  def initialize
    @runtime_methods = {}
    @runtime_class = Runtime['Class'] if defined?(Runtime)
    super(runtime_class)
  end

  def lookup(method_name)
    method = @runtime_methods[method_name]
    raise "Method not found: #{method_name}" if method.nil?

    method
  end

  def def(name, &block)
    @runtime_methods[name.to_s] = block
  end

  def new
    ToyLangObject.new(self)
  end

  def new_with_value(value)
    ToyLangObject.new(self, value)
  end
end
