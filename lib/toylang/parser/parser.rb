#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.6.0
# from Racc grammar file "".
#

require 'racc/parser.rb'

require_relative '../lexer/lexer'
require_relative '../ast/nodes'

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 149)
def parse(code, show_tokens=false)
  @tokens = Lexer.new.tokenize(code)
  puts @tokens.inspect if show_tokens
  do_parse
end

def next_token
  @tokens.shift
end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    28,    75,    26,    25,    27,    15,    17,    18,    19,    20,
    21,    22,    24,    15,    29,    46,    23,    45,    28,    74,
    26,    25,    27,    15,    17,    18,    19,    20,    21,    22,
    24,    14,    48,    16,    23,    81,    28,    80,    26,    25,
    27,    16,    17,    18,    19,    20,    21,    22,    24,    14,
    49,    16,    23,    28,    51,    26,    25,    27,    53,    17,
    18,    19,    20,    21,    22,    24,    89,    14,    88,    23,
    28,    55,    26,    25,    27,    31,    17,    18,    19,    20,
    21,    22,    24,    81,    14,    92,    23,    28,    75,    26,
    25,    27,    79,    17,    18,    19,    20,    21,    22,    24,
    31,    14,    31,    23,    28,    83,    26,    25,    27,    85,
    17,    18,    19,    20,    21,    22,    24,    75,    14,    75,
    23,    28,    94,    26,    25,    27,   nil,    17,    18,    19,
    20,    21,    22,    24,   nil,    14,   nil,    23,    28,   nil,
    26,    25,    27,   nil,    17,    18,    19,    20,    21,    22,
    24,   nil,    14,   nil,    23,    28,   nil,    26,    25,    27,
   nil,    17,    18,    19,    20,    21,    22,    24,   nil,    14,
   nil,    23,    28,   nil,    26,    25,    27,   nil,    17,    18,
    19,    20,    21,    22,    24,   nil,    14,   nil,    23,    28,
   nil,    26,    25,    27,   nil,    17,    18,    19,    20,    21,
    22,    24,   nil,    14,   nil,    23,    28,   nil,    26,    25,
    27,   nil,    17,    18,    19,    20,    21,    22,    24,   nil,
    14,   nil,    23,    28,   nil,    26,    25,    27,   nil,    17,
    18,    19,    20,    21,    22,    24,   nil,    14,   nil,    23,
    28,   nil,    26,    25,    27,   nil,    17,    18,    19,    20,
    21,    22,    24,   nil,    14,   nil,    23,    28,   nil,    26,
    25,    27,   nil,    17,    18,    19,    20,    21,    22,    24,
   nil,    14,   nil,    23,    28,   nil,    26,    25,    27,   nil,
    17,    18,    19,    20,    21,    22,    24,   nil,    14,   nil,
    23,    28,   nil,    26,    25,    27,   nil,    17,    18,    19,
    20,    21,    22,    24,   nil,    14,   nil,    23,    28,   nil,
    26,    25,    27,   nil,    17,    18,    19,    20,    21,    22,
    24,   nil,    14,   nil,    23,    28,   nil,    26,    25,    27,
   nil,    17,    18,    19,    20,    21,    22,    24,   nil,    14,
   nil,    23,    28,   nil,    26,    25,    27,   nil,    17,    18,
    19,    20,    21,    22,    24,   nil,    14,   nil,    23,    28,
   nil,    26,    25,    27,   nil,    17,    18,    19,    20,    21,
    22,    24,   nil,    14,   nil,    23,    28,   nil,    26,    25,
    27,   nil,    17,    18,    19,    20,    21,    22,    24,    15,
    14,    15,    23,    28,   nil,    26,    25,    27,    90,    17,
    18,    19,    20,    21,    22,    24,   nil,    14,    31,    23,
    42,    43,    40,    41,   nil,   nil,   nil,    16,    31,    16,
    42,    43,   nil,    31,    14,    42,    43,    40,    41,    36,
    37,    38,    39,    34,    35,    33,    32,    75,   nil,    31,
    68,    42,    43,    40,    41,    36,    37,    38,    39,    34,
    35,    33,    32,    75,   nil,    31,   nil,    42,    43,    40,
    41,    36,    37,    38,    39,    34,    35,    33,    32,    31,
   nil,    42,    43,    40,    41,    36,    37,    38,    39,    34,
    35,    33,    32,    31,   nil,    42,    43,    40,    41,    36,
    37,    38,    39,    34,    35,    33,    32,    31,   nil,    42,
    43,    40,    41,    36,    37,    38,    39,    34,    35,    33,
    32,    31,   nil,    42,    43,    40,    41,    36,    37,    38,
    39,    34,    35,    33,    32,    31,   nil,    42,    43,    40,
    41,    36,    37,    38,    39,    34,    35,    33,    32,    31,
   nil,    42,    43,    40,    41,    36,    37,    38,    39,    34,
    35,    33,    32,    31,   nil,    42,    43,    40,    41,    36,
    37,    38,    39,    34,    35,    33,    31,   nil,    42,    43,
    40,    41,    36,    37,    38,    39,    34,    35,    31,   nil,
    42,    43,    40,    41,    36,    37,    38,    39,    31,   nil,
    42,    43,    40,    41,    36,    37,    38,    39,    31,   nil,
    42,    43,    40,    41,    31,   nil,    42,    43,    40,    41,
    31,   nil,    42,    43,    40,    41,    31,   nil,    42,    43 ]

racc_action_check = [
     0,    49,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     2,     1,    22,     0,    22,    75,    49,
    75,    75,    75,    75,    75,    75,    75,    75,    75,    75,
    75,     0,    24,     0,    75,    69,    14,    69,    14,    14,
    14,     2,    14,    14,    14,    14,    14,    14,    14,    75,
    25,    75,    14,    23,    27,    23,    23,    23,    29,    23,
    23,    23,    23,    23,    23,    23,    82,    14,    82,    23,
    26,    31,    26,    26,    26,    47,    26,    26,    26,    26,
    26,    26,    26,    86,    23,    86,    26,    28,    51,    28,
    28,    28,    55,    28,    28,    28,    28,    28,    28,    28,
    66,    26,    67,    28,    30,    74,    30,    30,    30,    78,
    30,    30,    30,    30,    30,    30,    30,    85,    28,    88,
    30,    32,    89,    32,    32,    32,   nil,    32,    32,    32,
    32,    32,    32,    32,   nil,    30,   nil,    32,    33,   nil,
    33,    33,    33,   nil,    33,    33,    33,    33,    33,    33,
    33,   nil,    32,   nil,    33,    34,   nil,    34,    34,    34,
   nil,    34,    34,    34,    34,    34,    34,    34,   nil,    33,
   nil,    34,    35,   nil,    35,    35,    35,   nil,    35,    35,
    35,    35,    35,    35,    35,   nil,    34,   nil,    35,    36,
   nil,    36,    36,    36,   nil,    36,    36,    36,    36,    36,
    36,    36,   nil,    35,   nil,    36,    37,   nil,    37,    37,
    37,   nil,    37,    37,    37,    37,    37,    37,    37,   nil,
    36,   nil,    37,    38,   nil,    38,    38,    38,   nil,    38,
    38,    38,    38,    38,    38,    38,   nil,    37,   nil,    38,
    39,   nil,    39,    39,    39,   nil,    39,    39,    39,    39,
    39,    39,    39,   nil,    38,   nil,    39,    40,   nil,    40,
    40,    40,   nil,    40,    40,    40,    40,    40,    40,    40,
   nil,    39,   nil,    40,    41,   nil,    41,    41,    41,   nil,
    41,    41,    41,    41,    41,    41,    41,   nil,    40,   nil,
    41,    42,   nil,    42,    42,    42,   nil,    42,    42,    42,
    42,    42,    42,    42,   nil,    41,   nil,    42,    43,   nil,
    43,    43,    43,   nil,    43,    43,    43,    43,    43,    43,
    43,   nil,    42,   nil,    43,    45,   nil,    45,    45,    45,
   nil,    45,    45,    45,    45,    45,    45,    45,   nil,    43,
   nil,    45,    46,   nil,    46,    46,    46,   nil,    46,    46,
    46,    46,    46,    46,    46,   nil,    45,   nil,    46,    48,
   nil,    48,    48,    48,   nil,    48,    48,    48,    48,    48,
    48,    48,   nil,    46,   nil,    48,    79,   nil,    79,    79,
    79,   nil,    79,    79,    79,    79,    79,    79,    79,    84,
    48,    90,    79,    81,   nil,    81,    81,    81,    84,    81,
    81,    81,    81,    81,    81,    81,   nil,    79,    60,    81,
    60,    60,    60,    60,   nil,   nil,   nil,    84,    64,    90,
    64,    64,   nil,    44,    81,    44,    44,    44,    44,    44,
    44,    44,    44,    44,    44,    44,    44,    50,   nil,    50,
    44,    50,    50,    50,    50,    50,    50,    50,    50,    50,
    50,    50,    50,    52,   nil,    52,   nil,    52,    52,    52,
    52,    52,    52,    52,    52,    52,    52,    52,    52,     3,
   nil,     3,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,     3,    54,   nil,    54,    54,    54,    54,    54,
    54,    54,    54,    54,    54,    54,    54,    70,   nil,    70,
    70,    70,    70,    70,    70,    70,    70,    70,    70,    70,
    70,    71,   nil,    71,    71,    71,    71,    71,    71,    71,
    71,    71,    71,    71,    71,    72,   nil,    72,    72,    72,
    72,    72,    72,    72,    72,    72,    72,    72,    72,    87,
   nil,    87,    87,    87,    87,    87,    87,    87,    87,    87,
    87,    87,    87,    56,   nil,    56,    56,    56,    56,    56,
    56,    56,    56,    56,    56,    56,    57,   nil,    57,    57,
    57,    57,    57,    57,    57,    57,    57,    57,    58,   nil,
    58,    58,    58,    58,    58,    58,    58,    58,    59,   nil,
    59,    59,    59,    59,    59,    59,    59,    59,    61,   nil,
    61,    61,    61,    61,    62,   nil,    62,    62,    62,    62,
    63,   nil,    63,    63,    63,    63,    65,   nil,    65,    65 ]

racc_action_pointer = [
    -2,    14,     6,   452,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    34,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   -16,    51,     1,    37,    68,    40,    85,    58,
   102,    58,   119,   136,   153,   170,   187,   204,   221,   238,
   255,   272,   289,   306,   406,   323,   340,    58,   357,   -14,
   422,    73,   438,   nil,   466,    59,   536,   549,   561,   571,
   391,   581,   587,   593,   401,   599,    83,    85,   nil,     3,
   480,   494,   508,   nil,    92,    16,   nil,   nil,   106,   374,
   nil,   391,    34,   nil,   382,   102,    51,   522,   104,   109,
   384,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
    -1,   -58,    -2,    -3,    -6,    -7,    -8,    -9,   -10,   -11,
   -12,   -13,   -14,   -15,   -58,   -17,   -18,   -19,   -20,   -21,
   -22,   -23,   -24,   -58,   -44,   -58,   -58,   -58,   -58,   -58,
    -5,   -58,   -58,   -58,   -58,   -58,   -58,   -58,   -58,   -58,
   -58,   -58,   -58,   -58,   -58,   -28,   -58,   -43,   -58,   -58,
   -58,   -58,   -58,    96,    -4,   -26,   -31,   -32,   -33,   -34,
   -35,   -36,   -37,   -38,   -39,   -40,   -41,   -42,   -16,   -58,
   -29,   -45,   -46,   -47,   -49,   -58,   -52,   -53,   -54,   -28,
   -25,   -58,   -58,   -50,   -58,   -58,   -58,   -30,   -58,   -58,
   -56,   -55,   -27,   -48,   -51,   -57 ]

racc_goto_table = [
    30,     2,    44,    73,    76,    77,    78,    69,     1,    82,
   nil,    47,   nil,   nil,    50,   nil,    52,   nil,    54,   nil,
    56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
    66,    67,   nil,    70,    71,   nil,    72,   nil,   nil,    91,
   nil,    86,    93,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    70,   nil,    87,
   nil,   nil,   nil,   nil,   nil,   nil,    84,   nil,   nil,   nil,
   nil,   nil,    30,   nil,   nil,   nil,   nil,   nil,    95 ]

racc_goto_check = [
     4,     2,     3,    15,    15,    15,    15,    14,     1,    16,
   nil,     3,   nil,   nil,     3,   nil,     3,   nil,     3,   nil,
     3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,   nil,     3,     3,   nil,     3,   nil,   nil,    15,
   nil,    14,    15,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     3,   nil,     3,
   nil,   nil,   nil,   nil,   nil,   nil,     2,   nil,   nil,   nil,
   nil,   nil,     4,   nil,   nil,   nil,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,     8,     1,   -12,    -2,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   -38,   -46,   -65 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,     9,
    10,    11,    12,    13,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 37, :_reduce_1,
  1, 37, :_reduce_2,
  1, 38, :_reduce_3,
  3, 38, :_reduce_4,
  2, 38, :_reduce_5,
  1, 38, :_reduce_6,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  3, 39, :_reduce_16,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 41, :_reduce_19,
  1, 41, :_reduce_20,
  1, 41, :_reduce_21,
  1, 41, :_reduce_22,
  1, 41, :_reduce_23,
  1, 42, :_reduce_24,
  4, 42, :_reduce_25,
  3, 42, :_reduce_26,
  6, 42, :_reduce_27,
  0, 50, :_reduce_28,
  1, 50, :_reduce_29,
  3, 50, :_reduce_30,
  3, 43, :_reduce_31,
  3, 43, :_reduce_32,
  3, 43, :_reduce_33,
  3, 43, :_reduce_34,
  3, 43, :_reduce_35,
  3, 43, :_reduce_36,
  3, 43, :_reduce_37,
  3, 43, :_reduce_38,
  3, 43, :_reduce_39,
  3, 43, :_reduce_40,
  3, 43, :_reduce_41,
  3, 43, :_reduce_42,
  2, 43, :_reduce_43,
  1, 44, :_reduce_44,
  3, 45, :_reduce_45,
  3, 45, :_reduce_46,
  3, 46, :_reduce_47,
  6, 46, :_reduce_48,
  0, 52, :_reduce_49,
  1, 52, :_reduce_50,
  3, 52, :_reduce_51,
  3, 49, :_reduce_52,
  3, 47, :_reduce_53,
  3, 48, :_reduce_54,
  5, 48, :_reduce_55,
  3, 51, :_reduce_56,
  4, 51, :_reduce_57 ]

racc_reduce_n = 58

racc_shift_n = 96

racc_token_table = {
  false => 0,
  :error => 1,
  :IF => 2,
  :ELSE => 3,
  :WHILE => 4,
  :DEF => 5,
  :CLASS => 6,
  :NEWLINE => 7,
  :NUMBER => 8,
  :STRING => 9,
  :TRUE => 10,
  :FALSE => 11,
  :NIL => 12,
  :IDENTIFIER => 13,
  :CONSTANT => 14,
  :INDENT => 15,
  :DEDENT => 16,
  "." => 17,
  "!" => 18,
  "*" => 19,
  "/" => 20,
  "+" => 21,
  "-" => 22,
  ">" => 23,
  ">=" => 24,
  "<" => 25,
  "<=" => 26,
  "==" => 27,
  "!=" => 28,
  "&&" => 29,
  "||" => 30,
  "=" => 31,
  "," => 32,
  "(" => 33,
  ")" => 34,
  ";" => 35 }

racc_nt_base = 36

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IF",
  "ELSE",
  "WHILE",
  "DEF",
  "CLASS",
  "NEWLINE",
  "NUMBER",
  "STRING",
  "TRUE",
  "FALSE",
  "NIL",
  "IDENTIFIER",
  "CONSTANT",
  "INDENT",
  "DEDENT",
  "\".\"",
  "\"!\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"==\"",
  "\"!=\"",
  "\"&&\"",
  "\"||\"",
  "\"=\"",
  "\",\"",
  "\"(\"",
  "\")\"",
  "\";\"",
  "$start",
  "Root",
  "Expressions",
  "Expression",
  "Terminator",
  "Literal",
  "Call",
  "Operator",
  "Constant",
  "Assign",
  "Def",
  "Class",
  "IfElse",
  "While",
  "ArgList",
  "Block",
  "ParamList" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 30)
  def _reduce_1(val, _values, result)
     result = Nodes.new([])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 31)
  def _reduce_2(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 35)
  def _reduce_3(val, _values, result)
     result = Nodes.new(val)
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 36)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 37)
  def _reduce_5(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 38)
  def _reduce_6(val, _values, result)
     result = Nodes.new([])
    result
  end
.,.,

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

module_eval(<<'.,.,', 'grammar.y', 51)
  def _reduce_16(val, _values, result)
     result = val[1]
    result
  end
.,.,

# reduce 17 omitted

# reduce 18 omitted

module_eval(<<'.,.,', 'grammar.y', 60)
  def _reduce_19(val, _values, result)
     result = NumberNode.new(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 61)
  def _reduce_20(val, _values, result)
     result = StringNode.new(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 62)
  def _reduce_21(val, _values, result)
     result = TrueNode.new
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 63)
  def _reduce_22(val, _values, result)
     result = FalseNode.new
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 64)
  def _reduce_23(val, _values, result)
     result = NilNode.new
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 69)
  def _reduce_24(val, _values, result)
     result = CallNode.new(nil, val[0], [])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 71)
  def _reduce_25(val, _values, result)
     result = CallNode.new(nil, val[0], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 73)
  def _reduce_26(val, _values, result)
     result = CallNode.new(val[0], val[2], [])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 76)
  def _reduce_27(val, _values, result)
     result = CallNode.new(val[0], val[2], val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 80)
  def _reduce_28(val, _values, result)
     result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 81)
  def _reduce_29(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 82)
  def _reduce_30(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 86)
  def _reduce_31(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 87)
  def _reduce_32(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 88)
  def _reduce_33(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 89)
  def _reduce_34(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 90)
  def _reduce_35(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 91)
  def _reduce_36(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 92)
  def _reduce_37(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 93)
  def _reduce_38(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 94)
  def _reduce_39(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 95)
  def _reduce_40(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 96)
  def _reduce_41(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 97)
  def _reduce_42(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 98)
  def _reduce_43(val, _values, result)
     result = CallNode.new(val[1], val[0], [])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 102)
  def _reduce_44(val, _values, result)
     result = GetConstantNode.new(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 106)
  def _reduce_45(val, _values, result)
     result = SetLocalNode.new(val[0], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 107)
  def _reduce_46(val, _values, result)
     result = SetConstantNode.new(val[0], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 111)
  def _reduce_47(val, _values, result)
     result = DefNode.new(val[1], [], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 113)
  def _reduce_48(val, _values, result)
     result = DefNode.new(val[1], val[3], val[5])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 117)
  def _reduce_49(val, _values, result)
     result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 118)
  def _reduce_50(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 119)
  def _reduce_51(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 123)
  def _reduce_52(val, _values, result)
     result = WhileNode.new(val[1], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 127)
  def _reduce_53(val, _values, result)
     result = ClassNode.new(val[1], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 131)
  def _reduce_54(val, _values, result)
     result = IfNode.new(val[1], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 132)
  def _reduce_55(val, _values, result)
     result = IfElseNode.new(val[1], val[2], val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 136)
  def _reduce_56(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 138)
  def _reduce_57(val, _values, result)
     result = val[1]
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser