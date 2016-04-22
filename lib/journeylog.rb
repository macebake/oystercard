class JourneyLog
  attr_reader :log

  def initialize
    @log = []
  end

  def add(journey)
    @log << journey
  end

end
