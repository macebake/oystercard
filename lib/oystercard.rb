require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance, :current_journey, :in_use, :history

  def initialize
    @balance = 0
    @in_use = false
    @history = JourneyLog.new
  end

  def top_up money
    raise "Top up limit is #{MAXIMUM_BALANCE}" if over_max?(money)
    @balance += money
  end

  def touch_in station
    fail "You have insufficient funds" unless enough_balance?
    @in_use = true
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey = Journey.new unless @in_use
    @current_journey.finish(station)
    # deduct(@current_journey.fare)
    @history.add(@current_journey)
  end

  private

  def deduct money
    @balance -= money
  end

  def enough_balance?
    balance > 1
  end

  def over_max?(money)
    money + balance > MAXIMUM_BALANCE
  end

end
