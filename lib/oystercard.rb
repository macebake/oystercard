class Oystercard

	MAX_BALANCE = 90
	attr_reader :balance, :max_balance 
	
	def initialize(max_balance=MAX_BALANCE)
		@balance = 0
		@max_balance = max_balance
	end

	def top_up(amount)
		fail "Can't top up over £#{max_balance}" if @balance + amount > max_balance 
		@balance += amount
	end

end