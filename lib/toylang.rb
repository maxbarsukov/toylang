# frozen_string_literal: true

require_relative 'toylang/version'
require_relative 'toylang/ast/nodes'
require_relative 'toylang/lexer/lexer'
require_relative 'toylang/parser/parser'

module Toylang
  class Error < StandardError; end
  # Your code goes here...
end
