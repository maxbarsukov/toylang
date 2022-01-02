# frozen_string_literal: true

class Lexer
  KEYWORDS = %w[def class if else true false nil while].freeze

  def tokenize(code)
    code = code.chomp
    tokens = []
    parse_indent = true

    current_indent = 0
    indent_stack = []

    position = 0
    while position < code.size
      chunk = code[position..-1]

      if (identifier = chunk[/\A([a-z]\w*)/, 1])
        token, offset = tokenize_identifier(identifier)
        tokens << token

      elsif (constant = chunk[/\A([A-Z]\w*)/, 1])
        tokens << [:CONSTANT, constant]
        offset = constant.size
      elsif (number = chunk[/\A(([0-9]*[.])?[0-9]+)/, 1])
        tokens << [:NUMBER, number.to_numeric]
        offset = number.size

      elsif (string = chunk[/\A"([^"]*)"/, 1])
        tokens << [:STRING, string]
        offset = string.size + 2

      # Matches ": <newline> <spaces>"
      elsif parse_indent && (indent = chunk[/\A:\n( +)/m, 1])
        if indent.size <= current_indent
          raise "Bad indent level, got #{indent.size} indents, " \
                "expected > #{current_indent}"
        end
        current_indent = indent.size
        indent_stack.push(current_indent)
        tokens << [:INDENT, indent.size]
        offset = indent.size + 2

      elsif parse_indent && (indent = chunk[/\A\n( *)/m, 1])
        if indent.size == current_indent
          tokens << [:NEWLINE, "\n"]
        elsif indent.size < current_indent
          while indent.size < current_indent
            indent_stack.pop
            current_indent = indent_stack.last || 0
            tokens << [:DEDENT, indent.size]
          end
          tokens << [:NEWLINE, "\n"]
        else
          raise "Missing ':'"
        end
        offset = indent.size + 1

      elsif (operator = chunk[
        %r{\A(\|\||&&|==|!=|<=|>=|\+=|-=|\*=|/=|%=|\*\*=|&=|\|=|\^=|<<|>>|<<=|>>=|&&=|\|\|=|\*\*)}, 1])
        tokens << [operator, operator]
        offset = operator.size

      elsif chunk.start_with?(' ')
        offset = 1

      else
        value = chunk[0, 1]
        tokens << [value, value]
        offset = 1
      end
      position += offset
    end

    # Close all open blocks. If the code ends without dedenting, this will take care of
    tokens << [:DEDENT, indent_stack.first || 0] while indent_stack.pop
    tokens
  end

  def tokenize_identifier(identifier)
    token = if KEYWORDS.include?(identifier)
              # keywords will generate [:IF, "if"]
              [identifier.upcase.to_sym, identifier]
            else
              [:IDENTIFIER, identifier]
            end
    [token, identifier.size]
  end
end
