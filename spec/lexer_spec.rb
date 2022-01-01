# frozen_string_literal: true

require_relative '../lib/toylang/lexer/lexer'

RSpec.describe Lexer do
  lexer = described_class.new

  it 'tokenizes a number' do
    expect(lexer.tokenize('1')).to eq [[:NUMBER, 1]]
  end

  it 'tokenizes a string' do
    expect(lexer.tokenize('"hi"')).to eq [[:STRING, 'hi']]
  end

  it 'tokenizes an identifier' do
    expect(lexer.tokenize('name')).to eq [[:IDENTIFIER, 'name']]
  end

  it 'tokenizes keywords' do
    expect(lexer.tokenize('while')).to eq [[:WHILE, 'while']]
  end

  it 'tokenizes an operator' do
    %w[+ || && ) < >].each do |operator|
      expect(lexer.tokenize(operator)).to eq [[operator, operator]]
    end
  end

  it 'tokenizes indents' do
    code = <<~CODE
      if 1:
        if 2:
          print("...")
          if false:
            pass
          print("done!")
        2

      print "The End"
    CODE

    tokens = [
      [:IF, 'if'], [:NUMBER, 1],                     # if 1:
      [:INDENT, 2],
      [:IF, 'if'], [:NUMBER, 2],                     # if 2:
      [:INDENT, 4],
      [:IDENTIFIER, 'print'], ['(', '('],            # print("...")
      [:STRING, '...'],
      [')', ')'],
      [:NEWLINE, "\n"],
      [:IF, 'if'], [:FALSE, 'false'],                # if false:
      [:INDENT, 6],
      [:IDENTIFIER, 'pass'],                         # pass
      [:DEDENT, 4], [:NEWLINE, "\n"],
      [:IDENTIFIER, 'print'], ['(', '('],            # print("done!")
      [:STRING, 'done!'],
      [')', ')'],
      [:DEDENT, 2], [:NEWLINE, "\n"],
      [:NUMBER, 2],                                  # 2
      [:DEDENT, 0], [:NEWLINE, "\n"],
      [:NEWLINE, "\n"],                              #
      [:IDENTIFIER, 'print'], [:STRING, 'The End']   # print "The End"
    ]

    expect(lexer.tokenize(code)).to eq tokens
  end
end
