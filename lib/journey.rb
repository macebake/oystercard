class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station, :journeys

 def initialize (*entry_station)
  @entry_station = entry_station
  @exit_station = nil
  @journeys={}
  @journeys[:entry_station]=entry_station
  @complete = false
 end


# def start(station)
#   @entry_station = station
#   @journeys[:entry_station]=station
    # @complete = false
# end
  def finish(station)
    #@entry_station = nil
    @exit_station=station
    @journeys[:exit_station]=station
    @complete=true
  end



  def complete?
    # @complete
     @exit_station && @entry_station

     #this needs to return a booolean if both true else false
  end

  def fare
    #calls complete if true charges 1 else penalty fare
    complete? ? 1 : PENALTY_FARE

  end

  private
  def caculate_penalty?

  end
end
