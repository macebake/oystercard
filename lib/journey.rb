class Journey
  PENALTY_FARE = 6
  MIN_FARE = 1
  attr_reader :entry_station, :exit_station, :journeys

  def initialize
  @journeys={}
  end
  def start(station)
  #  @entry_station = station
    @journeys[:entry_station]=station
  end

  def finish(station)
  #  @exit_station=station
    @journeys[:exit_station]=station
  end

  def complete?
      (journeys.has_key?(:entry_station) && journeys.has_key?(:exit_station)) || journeys.empty?
    # (@exit_station && @entry_station) || journeys.empty?
  end

  def in_journey?
     journeys.has_key?(:entry_station) && !journeys.has_key?(:exit_station)
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  private

  def caculate_penalty?

  end
end
