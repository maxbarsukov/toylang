# frozen_string_literal: true

Nodes = Struct.new(:nodes) do
  def <<(node)
    nodes << node
    self
  end
end

LiteralNode = Struct.new(:value)

class NumberNode < LiteralNode; end
class StringNode < LiteralNode; end

class TrueNode < LiteralNode
  def initialize
    super(true)
  end
end

class FalseNode < LiteralNode
  def initialize
    super(false)
  end
end

class NilNode < LiteralNode
  def initialize
    super(nil)
  end
end

CallNode = Struct.new(:receiver, :call_method, :arguments)

GetConstantNode = Struct.new(:name)
SetConstantNode = Struct.new(:name, :value)

GetLocalNode = Struct.new(:name)
SetLocalNode = Struct.new(:name, :value)

DefNode = Struct.new(:name, :params, :body)

ClassNode = Struct.new(:name, :body, :superclass)
IfElseNode = Struct.new(:condition, :body, :else_body)
WhileNode = Struct.new(:condition, :body)
