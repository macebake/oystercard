require_relative 'journeylog'

class Journey

  PENALTY_FARE = 6
  STANDARD_FARE = 1

  def initialize(*station)
    @entry_station = station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
    # @journeylog.start(@entry_station)
    # @journeylog.finish(station)
  end

  def fare
    return PENALTY_FARE unless complete?
    STANDARD_FARE
  end

  def log
    { @entry_station[0] => @exit_station }
    # @journeylog << self
  end

  private

  def complete?
    @entry_station.any? && @exit_station != nil
  end

end
