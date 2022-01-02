# frozen_string_literal: true

RSpec.describe Interpreter do
  interpreter = described_class.new

  describe 'Number' do
    describe 'Binary' do
      it '+' do
        expect(interpreter.eval('1 + 2').ruby_value).to eq 3
        expect(interpreter.eval('1.1 + 2').ruby_value).to eq 3.1
        expect(interpreter.eval('0.1 + 2.1').ruby_value).to eq 2.2
        expect(interpreter.eval('0.1 + 0.2').ruby_value).to eq 0.30000000000000004
        expect(interpreter.eval('10.000 + 20000').ruby_value).to eq 20_010
      end

      it '-' do
        expect(interpreter.eval('3 - 2').ruby_value).to eq 1
        expect(interpreter.eval('1 - 2').ruby_value).to eq(-1)
        expect(interpreter.eval('11.5 - 2.3').ruby_value).to eq 9.2
      end

      it '*' do
        expect(interpreter.eval('5 * 7').ruby_value).to eq 35
        expect(interpreter.eval('3.2 * 9.87').ruby_value).to eq 31.584
        expect(interpreter.eval('-5 * 7').ruby_value).to eq(-35)
      end

      it '/' do
        expect(interpreter.eval('25 / 5').ruby_value).to eq 5
        expect { interpreter.eval('25 / 0').ruby_value }.to raise_error(ZeroDivisionError)
        expect(interpreter.eval('25 / 0.0').ruby_value).to eq Float::INFINITY
        expect(interpreter.eval('25 / 5.0').ruby_value).to eq 5.0
        expect(interpreter.eval('25 / 4').ruby_value).to eq 6
        expect(interpreter.eval('25 / 4.0').ruby_value).to eq 6.25
      end

      it '%' do
        expect(interpreter.eval('5 % 2').ruby_value).to eq 1
        expect(interpreter.eval('6 % 2').ruby_value).to eq 0
        expect(interpreter.eval('-11 % 5').ruby_value).to eq 4
        expect(interpreter.eval('11 % 5').ruby_value).to eq 1
        expect(interpreter.eval('11 % -5').ruby_value).to eq(-4)
        expect(interpreter.eval('-11 % -5').ruby_value).to eq(-1)
      end

      it '**' do
        pp Parser.new.parse('-5 ** 4')
        expect(interpreter.eval('5 ** 3').ruby_value).to eq 125
        expect(interpreter.eval('(-5) ** 4').ruby_value).to eq 625
        expect(interpreter.eval('-(5 ** 4)').ruby_value).to eq(-625)
        expect(interpreter.eval('1 ** 1000').ruby_value).to eq 1
        expect(interpreter.eval('100 ** 0').ruby_value).to eq 1
      end

      it '<' do
        expect(interpreter.eval('1 < 2').ruby_value).to eq true
        expect(interpreter.eval('11 < 2').ruby_value).to eq false
        expect(interpreter.eval('-11 < 2').ruby_value).to eq true
      end

      it '<=' do
        expect(interpreter.eval('1 <= 2').ruby_value).to eq true
        expect(interpreter.eval('1 <= 1').ruby_value).to eq true
        expect(interpreter.eval('11 <= 1').ruby_value).to eq false
        expect(interpreter.eval('-11 <= 1').ruby_value).to eq true
      end

      it '>' do
        expect(interpreter.eval('11 > 2').ruby_value).to eq true
        expect(interpreter.eval('1 > 2').ruby_value).to eq false
        expect(interpreter.eval('-1 > 2').ruby_value).to eq false
      end

      it '>=' do
        expect(interpreter.eval('1 >= 2').ruby_value).to eq false
        expect(interpreter.eval('1 >= 1').ruby_value).to eq true
        expect(interpreter.eval('11 >= 1').ruby_value).to eq true
        expect(interpreter.eval('-1 >= 1').ruby_value).to eq false
      end

      it '==' do
        expect(interpreter.eval('1 == 2').ruby_value).to eq false
        expect(interpreter.eval('1 == 1').ruby_value).to eq true
        expect(interpreter.eval('11 == 1').ruby_value).to eq false
        expect(interpreter.eval('-1 == 1').ruby_value).to eq false
      end

      it '!=' do
        expect(interpreter.eval('1 != 2').ruby_value).to eq true
        expect(interpreter.eval('1 != 1').ruby_value).to eq false
        expect(interpreter.eval('11 != 1').ruby_value).to eq true
        expect(interpreter.eval('-1 != 1').ruby_value).to eq true
      end

      it '&' do
        expect(interpreter.eval('53 & 34').ruby_value).to eq 32
        expect(interpreter.eval('-23 & -4').ruby_value).to eq(-24)
      end

      it '|' do
        expect(interpreter.eval('53 | 34').ruby_value).to eq 55
        expect(interpreter.eval('-23 | -4').ruby_value).to eq(-3)
      end

      it '^' do
        expect(interpreter.eval('53 ^ 34').ruby_value).to eq 23
        expect(interpreter.eval('-23 ^ -4').ruby_value).to eq 21
      end

      it '<<' do
        expect(interpreter.eval('3 << 4').ruby_value).to eq 48
        expect(interpreter.eval('-12 << -3').ruby_value).to eq(-2)
      end

      it '>>' do
        expect(interpreter.eval('256 >> 2').ruby_value).to eq 64
        expect(interpreter.eval('-34 >> 3').ruby_value).to eq(-5)
      end

      it '||' do
        expect(interpreter.eval('12 || 5').ruby_value).to eq 12
        expect(interpreter.eval('0 || 11').ruby_value).to eq 0
      end

      it '&&' do
        expect(interpreter.eval('12 && 4').ruby_value).to eq 4
        expect(interpreter.eval('12 && 0').ruby_value).to eq 0
      end
    end

    describe 'Unary' do
      it '!' do
        expect(interpreter.eval('!2').ruby_value).to eq false
        expect(interpreter.eval('!0').ruby_value).to eq false
      end

      it '-' do
        expect(interpreter.eval('-1').ruby_value).to eq(-1)
        expect(interpreter.eval('-(-1)').ruby_value).to eq 1
        expect(interpreter.eval('a = -1; -a').ruby_value).to eq 1
      end

      it '~' do
        expect(interpreter.eval('~35').ruby_value).to eq(-36)
        expect(interpreter.eval('~-12').ruby_value).to eq 11
      end
    end
  end
end
