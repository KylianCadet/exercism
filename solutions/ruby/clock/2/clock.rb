class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour || 0
    @minute = minute || 0
    compute_time
  end

  def to_s
    "#{@hour.to_s.rjust(2, '0')}:#{@minute.to_s.rjust(2, '0')}"
  end

  def +(other)
    @hour += other.hour
    @minute += other.minute
    compute_time
    self
  end

  def -(other)
    @hour -= other.hour
    @minute -= other.minute
    compute_time
    self
  end

  def ==(other)
    @hour == other.hour and @minute ==other.minute
  end

  private
  def compute_time
    @hour += @minute / 60
    @minute %= 60
    @hour %= 24
  end
end