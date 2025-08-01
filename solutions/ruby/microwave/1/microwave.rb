class Microwave
  def initialize(seconds)
    if seconds < 100
      @minutes = seconds / 60
      @seconds = seconds % 60
    else
      @minutes = seconds / 100
      @seconds = seconds % 100
      if @seconds >= 60
        @minutes += @seconds / 60
        @seconds = @seconds % 60
      end
    end
  end

  def timer
    "#{@minutes.to_s.rjust(2, '0')}:#{@seconds.to_s.rjust(2, '0')}"
  end
end