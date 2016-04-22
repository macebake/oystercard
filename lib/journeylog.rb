class JourneyLog

  def initialize
    @log = []
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def current_journey
    { @entry_station => @exit_station }
  end

  def history
    @log << current_journey
  end

end
