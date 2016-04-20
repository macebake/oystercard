class Journey
  attr_reader :complete, :entry_station

  PENALTY_FARE = 6
  STANDARD_FARE = 1

  def initialize(station)
    @complete = false
    @entry_station = station
  end

  def finish(station)
    @complete = true
    # journey_log(station)
    # fare(station)
  end

  def fare
    STANDARD_FARE
  end

  def complete?
    @complete
  end

  # def journey_log(exit_station)
  #   { @entry_station: exit_station }
  # end

end
