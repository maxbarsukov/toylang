# frozen_string_literal: true

toylang_class = ToyLangClass.new
toylang_class.runtime_class = toylang_class
object_class = ToyLangClass.new
object_class.runtime_class = toylang_class

Runtime = Context.new(object_class.new)

Runtime['Class'] = toylang_class
Runtime['Object'] = object_class
Runtime['Number'] = ToyLangClass.new
Runtime['String'] = ToyLangClass.new

Runtime['TrueClass'] = ToyLangClass.new
Runtime['FalseClass'] = ToyLangClass.new
Runtime['NilClass'] = ToyLangClass.new

Runtime['true'] = Runtime['TrueClass'].new_with_value(true)
Runtime['false'] = Runtime['FalseClass'].new_with_value(false)
Runtime['nil'] = Runtime['NilClass'].new_with_value(nil)

# Add the `new` method to classes, used to instantiate a class
Runtime['Class'].runtime_methods['new'] = proc do |receiver, _arguments|
  receiver.new
end

# Print an object to the console.
Runtime['Object'].runtime_methods['print'] = proc do |_receiver, arguments|
  print arguments.first.ruby_value
  Runtime['nil']
end

# Print an object to the console with new line.
Runtime['Object'].runtime_methods['println'] = proc do |_receiver, arguments|
  puts arguments.first.ruby_value
  Runtime['nil']
end

# Object to string
Runtime['Object'].runtime_methods['to_string'] = proc do |_receiver, arguments|
  Runtime['String'].new_with_value(arguments.first.ruby_value.to_s)
end

Runtime['Object'].runtime_methods['inspect'] = proc do |_receiver, arguments|
  Runtime['String'].new_with_value(arguments.first.ruby_value.inspect)
end

### Numbers
# Binary operators
%w[+ * / % < <= == > >= != & | ^ >> << || &&].each do |operator|
  Runtime['Number'].runtime_methods[operator] = proc do |receiver, arguments|
    result = eval("#{receiver.ruby_value} #{operator} #{arguments.first.ruby_value}") # rubocop:disable Security/Eval, Style/EvalWithLocation
    Runtime['Number'].new_with_value(result)
  end
end

Runtime['Number'].runtime_methods['**'] = proc do |receiver, arguments|
  rec = if receiver.ruby_value.negative? && arguments.first.ruby_value.even?
          receiver.ruby_value.abs
        else
          receiver.ruby_value
        end
  result = rec**arguments.first.ruby_value
  Runtime['Number'].new_with_value(result)
end

# Unary operators
%w[! ~].each do |operator|
  Runtime['Number'].runtime_methods[operator] = proc do |receiver, _arguments|
    result = eval("#{operator}#{receiver.ruby_value}") # rubocop:disable Security/Eval, Style/EvalWithLocation
    Runtime['Number'].new_with_value(result)
  end
end

Runtime['Number'].runtime_methods['-'] = proc do |receiver, arguments|
  result = if arguments.size.zero?
             -receiver.ruby_value
           else
             receiver.ruby_value - arguments.first.ruby_value
           end
  Runtime['Number'].new_with_value(result)
end

### Booleans
boolean_operators = %w[== != && & || | ^]
%w[TrueClass FalseClass].each do |boolean|
  boolean_operators.each do |operator|
    Runtime[boolean].runtime_methods[operator] = proc do |receiver, arguments|
      result = eval("#{receiver.ruby_value} #{operator} #{arguments.first.ruby_value}") # rubocop:disable Security/Eval, Style/EvalWithLocation
      Runtime[boolean].new_with_value(result)
    end
  end
  Runtime[boolean].runtime_methods['!'] = proc do |receiver, _arguments|
    result = !receiver.ruby_value
    Runtime[boolean].new_with_value(result)
  end
end
