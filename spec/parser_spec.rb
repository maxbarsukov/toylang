# frozen_string_literal: true

RSpec.describe Parser do
  parser = described_class.new

  it 'parses a number' do
    expect(parser.parse('1')).to eq Nodes.new([NumberNode.new(1)])
  end

  it 'parses an expression' do
    expect(parser.parse(%(1\n"hi"))).to eq Nodes.new([NumberNode.new(1), StringNode.new('hi')])
  end

  it 'parses call' do
    expect(parser.parse('1.method')).to eq Nodes.new([CallNode.new(NumberNode.new(1), 'method', [])])
  end

  it 'parses call with arguments' do
    expect(parser.parse('method(1, 2)')).to eq Nodes.new([CallNode.new(nil, 'method',
                                                                       [NumberNode.new(1), NumberNode.new(2)])])
  end

  it 'parses assign' do
    expect(parser.parse('a = 1')).to eq Nodes.new([SetLocalNode.new('a', NumberNode.new(1))])
    expect(parser.parse('A = 1')).to eq Nodes.new([SetConstantNode.new('A', NumberNode.new(1))])
  end

  it 'parses def' do
    code = <<-CODE
    def method:
      true
    CODE
    nodes = Nodes.new([
                        DefNode.new('method', [],
                                    Nodes.new([TrueNode.new]))
                      ])
    expect(parser.parse(code)).to eq nodes
  end

  it 'parses def with arguments' do
    code = <<-CODE
    def method(a, b):
      true
    CODE
    nodes = Nodes.new([
                        DefNode.new('method', %w[a b],
                                    Nodes.new([TrueNode.new]))
                      ])
    expect(parser.parse(code)).to eq nodes
  end

  it 'parses class' do
    code = <<-CODE
    class Klass:
      true
    CODE
    nodes = Nodes.new([
                        ClassNode.new('Klass',
                                      Nodes.new([TrueNode.new]))
                      ])
    expect(parser.parse(code)).to eq nodes
  end

  it 'parses arithmetic' do
    nodes = Nodes.new([CallNode.new(NumberNode.new(1), '+',
                                    [CallNode.new(NumberNode.new(2), '*', [NumberNode.new(3)])])])
    expect(parser.parse('1 + 2 * 3')).to eq nodes
    expect(parser.parse('1 + (2 * 3)')).to eq nodes
  end

  it 'parses binary operators' do
    nodes = Nodes.new([CallNode.new(CallNode.new(NumberNode.new(1), '+', [NumberNode.new(2)]), '||',
                                    [NumberNode.new(3)])])
    expect(parser.parse('1 + 2 || 3')).to eq nodes
    expect(parser.parse('(1 + 2) || 3')).to eq nodes
  end

  it 'parses unary operators' do
    nodes = Nodes.new([CallNode.new(NumberNode.new(2), '!', [])])
    expect(parser.parse('!2')).to eq nodes
  end

  it 'parses if' do
    code = <<-CODE
    if true:
      nil
    CODE
    nodes = Nodes.new([IfElseNode.new(TrueNode.new, Nodes.new([NilNode.new]), nil)])
    expect(parser.parse(code)).to eq nodes
  end

  it 'parses if/else' do
    code = <<-CODE
    if true:
      nil
    else:
      1
    CODE
    nodes = Nodes.new([IfElseNode.new(TrueNode.new, Nodes.new([NilNode.new]), Nodes.new([NumberNode.new(1)]))])
    expect(parser.parse(code)).to eq nodes
  end

  it 'parses while' do
    code = <<-CODE
    while true:
      nil
    CODE
    nodes = Nodes.new([WhileNode.new(TrueNode.new, Nodes.new([NilNode.new]))])
    expect(parser.parse(code)).to eq nodes
  end
end
