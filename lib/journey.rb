class Journey

  def initialize start
    @start = start
  end

  attr_writer :end

  def start
    @start
  end

  def end
    @end
  end

end
