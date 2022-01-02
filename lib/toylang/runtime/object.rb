# frozen_string_literal: true

class ToyLangObject
  attr_accessor :runtime_class, :ruby_value

  def initialize(runtime_class, ruby_value = self)
    @runtime_class = runtime_class
    @ruby_value = ruby_value
  end

  def call(method, arguments = [])
    @runtime_class.lookup(method).call(self, arguments)
  end

  def inspect
    "#<ToyLangObject class=#{@runtime_class} ruby_value=#{@ruby_value}"
  end
end
