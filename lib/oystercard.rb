class Oystercard
	MAX_BALANCE = 90
  MIN_FARE = 1
	attr_reader :balance, :max_balance, :entry_station, :card_journeys, :exit_station

	def initialize(max_balance=MAX_BALANCE)
		@balance = 0
		@max_balance = max_balance
    @card_journeys = {}
	end

	def top_up(amount)
		fail "Can't top up over £#{max_balance}" if @balance + amount > max_balance
		@balance += amount
	end


  def touch_in(station)
    fail "card already in journey" if in_journey?
    fail "not enough money on the card min balance of £#{MIN_FARE}" if @balance < MIN_FARE
    @entry_station = station
    @card_journeys.merge!(entry_station: Journey.new.start(station))
  end

  def touch_out(station)
    fail "card not in journey" unless in_journey?
    deduct_fare
    @entry_station = nil
     @card_journeys.merge!(exit_station: Journey.new.finish(station))
  end

  def in_journey?
    !!@entry_station
  end

private

  def deduct_fare
    @balance -= MIN_FARE
  end

end