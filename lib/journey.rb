class Journey
  attr_reader :complete
  attr_accessor :entry_station
  PENALTY_FARE = 6
  STANDARD_FARE = 1

  def initialize(station)
    @journey_log = []
    @complete = false
  end

  def finish station
    @complete = true

  end

  def fare
    PENALTY_FARE
  end

  def complete?
    @complete
  end
end
