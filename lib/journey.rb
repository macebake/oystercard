class Journey
def initialize
  @journeys = {}
end
def touch_in
  @journeys[:entry_station]=station
end
def touch_out
  @journeys[:exit_station]=station
end
