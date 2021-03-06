# frozen_string_literal: true

require_relative 'toylang/version'
require_relative 'toylang/monkey_patching/string'
require_relative 'toylang/ast/nodes'
require_relative 'toylang/lexer/lexer'
require_relative 'toylang/parser/parser'
require_relative 'toylang/runtime/object'
require_relative 'toylang/runtime/class'
require_relative 'toylang/runtime/method'
require_relative 'toylang/runtime/context'
require_relative 'toylang/runtime/bootstrap'
require_relative 'toylang/interpreter/interpreter'
require_relative 'toylang/interpreter/evaluation'

module Toylang
  class Error < StandardError; end
  # Your code goes here...
end
