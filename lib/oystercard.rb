class Oystercard
	MAX_BALANCE = 90
  MIN_FARE = 1
	attr_reader :balance, :max_balance, :entry_station

	def initialize(max_balance=MAX_BALANCE)
		@balance = 0
		@max_balance = max_balance
	end

	def top_up(amount)
		fail "Can't top up over £#{max_balance}" if @balance + amount > max_balance
		@balance += amount
	end


  def touch_in(station)
    fail "card already in journey" if in_journey?
    fail "not enough money on the card min balance of £#{MIN_FARE}" if @balance < MIN_FARE
    @in_journey=true
    @entry_station = station
  end

  def touch_out
    fail "card not in journey" unless in_journey?
    deduct_fare
     @in_journey=false
  end

  def in_journey?
    @in_journey
  end

private

  def deduct_fare
    @balance -= MIN_FARE
  end

end