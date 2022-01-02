# frozen_string_literal: true

require_relative '../parser/parser'
require_relative '../runtime/bootstrap'

class Interpreter
  def initialize
    @parser = Parser.new
  end

  def eval(code)
    @parser.parse(code).eval(Runtime)
  end
end
