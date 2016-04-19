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

  def deduct_fare(fare)
    fail "Not enough credit on card" if fare > @balance
    @balance -= fare
  end
  def touch_in
    fail "card already in journey" if in_journey?
    @in_journey=true
  end

  def touch_out
    fail "card not in journey" unless in_journey?
     @in_journey=false
  end

  def in_journey?
    @in_journey
  end
end