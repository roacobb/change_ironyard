class Coin
	def initialize 
		@quarters = 25
		@dimes = 10
		@nickels = 5
		@penny = 1
	end
  
  attr_reader :quarters, :dimes, :nickels, :penny
  #def quarters
  	#@quarters
  #end

	def change_one_coin total, amount
		count = (total/amount).round
		leftover = (total % amount).round
		return [count, leftover]
	end
end