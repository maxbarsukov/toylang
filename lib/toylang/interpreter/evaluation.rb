# frozen_string_literal: true

require_relative '../parser/parser'
require_relative '../runtime/object'
require_relative '../runtime/class'
require_relative '../runtime/method'
require_relative '../runtime/context'
require_relative '../runtime/bootstrap'

class Nodes
  def eval(context)
    return_value = nil
    nodes.each do |node|
      return_value = node.eval(context)
    end
    return_value || Runtime['nil']
  end
end

class NumberNode
  def eval(_context)
    Runtime['Number'].new_with_value(value)
  end
end

class StringNode
  def eval(_context)
    Runtime['String'].new_with_value(value)
  end
end

class TrueNode
  def eval(_context)
    Runtime['true']
  end
end

class FalseNode
  def eval(_context)
    Runtime['false']
  end
end

class NilNode
  def eval(_context)
    Runtime['nil']
  end
end

class GetConstantNode
  def eval(context)
    context[name]
  end
end

class GetLocalNode
  def eval(context)
    context.locals[name]
  end
end

class SetConstantNode
  def eval(context)
    context[name] = value.eval(context)
  end
end

class SetLocalNode
  def eval(context)
    context.locals[name] = value.eval(context)
  end
end

class CallNode
  def eval(context)
    if receiver.nil? && context.locals[call_method] && arguments.empty?
      context.locals[call_method]
    else
      value = if receiver
                receiver.eval(context)
              else
                context.current_self
              end
      eval_arguments = arguments.map { |arg| arg.eval(context) }
      value.call(call_method, eval_arguments)
    end
  end
end

class DefNode
  def eval(context)
    method = ToyLangMethod.new(params, body)
    context.current_class.runtime_methods[name] = method
  end
end

class ClassNode
  def eval(context)
    toylang_class = context[name]

    unless toylang_class
      toylang_class = ToyLangClass.new
      context[name] = toylang_class
    end

    class_context = Context.new(toylang_class, toylang_class)
    body.eval(class_context)

    toylang_class
  end
end

class IfElseNode
  def eval(context)
    if condition.eval(context).ruby_value
      body.eval(context)
    elsif else_body.nil?
      Runtime['nil']
    else
      else_body.eval(context)
    end
  end
end

class WhileNode
  def eval(context)
    while condition.eval(context).ruby_value
      body.eval(context)
    end
  end
end
