# frozen_string_literal: true

awesome_class = ToyLangClass.new
awesome_class.runtime_class = awesome_class
object_class = ToyLangClass.new
object_class.runtime_class = awesome_class

Runtime = Context.new(object_class.new)

Runtime['Class'] = awesome_class
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
  puts arguments.first.ruby_value
  Runtime['nil']
end
