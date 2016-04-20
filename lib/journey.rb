class Journey

  def initialize start
    @journey_log = {:start => start}
  end

  def get_start
    @journey_log[:start]
  end

  def get_end
    @journey_log[:end]
  end

  def end end_station
    @journey_log[:end] = end_station
  end

end
