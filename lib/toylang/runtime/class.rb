# frozen_string_literal: true

class ToyLangClass < ToyLangObject
  attr_reader :runtime_methods

  def initialize(superclass = nil)
    @runtime_methods = {}
    @runtime_class = Runtime['Class'] if defined?(Runtime)
    @runtime_superclass = superclass
    super(runtime_class)
  end

  def lookup(method_name)
    method = @runtime_methods[method_name]
    unless method
      return @runtime_superclass.lookup(method_name) if @runtime_superclass

      raise "Method not found: #{method_name}"
    end

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

  def inspect
    "#<ToyLangClass class=#{@runtime_class} superclass=#{@runtime_superclass}"
  end
end
