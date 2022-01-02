# frozen_string_literal: true

RSpec.describe Interpreter do
  interpreter = described_class.new

  it 'interprets a number' do
    expect(interpreter.eval('1').ruby_value).to eq 1
  end

  it 'interprets boolean' do
    expect(interpreter.eval('true').ruby_value).to eq true
  end

  it 'interprets a string' do
    expect(interpreter.eval('"hello"').ruby_value).to eq 'hello'
  end

  it 'interprets a nil' do
    expect(interpreter.eval('nil').ruby_value).to eq nil
  end

  it 'interprets assign' do
    expect(interpreter.eval('a = 2; 3; a').ruby_value).to eq 2
  end

  it 'interprets method' do
    code = <<~CODE
      def boo(a):
        a

      boo("yah!")
    CODE
    expect(interpreter.eval(code).ruby_value).to eq 'yah!'
  end

  it 'interprets monkey patching' do
    code = <<~CODE
      class Number:
        def ten:
          10

      1.ten
    CODE
    expect(interpreter.eval(code).ruby_value).to eq 10
  end

  it 'interprets if' do
    code = <<~CODE
      if true:
        "works!"
    CODE
    expect(interpreter.eval(code).ruby_value).to eq 'works!'
  end

  it 'interprets if/else' do
    code = <<~CODE
      if true:
        "works!"
      else:
        "no!"
    CODE
    expect(interpreter.eval(code).ruby_value).to eq 'works!'
  end

  it 'interprets while' do
    code = <<~CODE
      a = 0
      while (a < 3):
        println(a)
        a = a + 1
    CODE
    expect do
      interpreter.eval(code)
    end.to output("0\n1\n2\n").to_stdout
  end

  it 'interprets math' do
    code = <<~CODE
      a = 0
      a = a + 1
      a
    CODE
    expect(interpreter.eval(code).ruby_value).to eq 1
  end

  it 'interprets else' do
    code = <<~CODE
      if false:
        "works!"
      else:
        "no!"
    CODE
    expect(interpreter.eval(code).ruby_value).to eq 'no!'
  end

  it 'interprets class definition' do
    code = <<~CODE
      class Klass:
        def my_method:
          true

      Klass.new.my_method
    CODE
    expect(interpreter.eval(code).ruby_value).to eq true
  end

  it 'interpreting object creating and method calling' do
    code = <<~CODE
      class Car:
        def does_it_work:
          "yeah!"

      car = Car.new
      if car:
        print(car.does_it_work)

    CODE
    expect do
      interpreter.eval(code)
    end.to output('yeah!').to_stdout
  end
end
