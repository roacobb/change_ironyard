# Write a Register class with a change function that takes an amount of money and returns the number of quarters, dimes, nickels and pennies needed to produce that amount:
# r = Register.new r.change 0.99 # => [3, 2, 0, 4]
# 
require 'Minitest/autorun'
require 'pry'
require './coin'

class Register
  def change amount
    amount = (amount * 100).to_i

    c = Coin.new
		qtr_result = c.change_one_coin amount, c.quarters
		qtr_number = qtr_result[0]
		qtr_leftover = qtr_result[1]

		di_result = c.change_one_coin qtr_leftover, c.dimes
		di_number = di_result[0]
		di_leftover = di_result[1]

		nick_result = c.change_one_coin di_leftover, c.nickels
		nick_number = nick_result[0]
		nick_leftover = nick_result[1]

		pe_result = c.change_one_coin nick_leftover, c.penny
		pe_number = pe_result[0]
		pe_leftover = pe_result[1]

		return [qtr_number,di_number,nick_number,pe_number]
	end
end

Register.new.change(0.56)

class Register::Test < Minitest::Test
	def coins_to_dollar
    r = Register.new
    result = r.change 0.56
    assert_equal result, [2,0,1,1]
  end
end