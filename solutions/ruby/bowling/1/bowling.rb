class Game
  class BowlingError < StandardError
  end

  def initialize
    @frames = []
  end

  def roll(pin)
    raise BowlingError.new() unless pin.between?(0, 10)
    raise BowlingError.new() if finish?

    @frames << [] if @frames.length.zero? or @frames.last.sum == 10 or @frames.last.length == 2
    @frames.last << pin

    raise BowlingError.new() if @frames.last.sum > 10
  end

  def score
    raise BowlingError.new() unless finish?

    @frames.each.with_index.inject(0) {|score, (frame, index)|
      next score if index >= 10 # Don't compute bonus frames
      pins = frame
      pins << @frames[index + 1]
      pins << @frames[index + 2]
      pins = pins.flatten.compact
      pins = pins.first(3)
      pins = pins.first(2) unless [pins[0], pins[1]].sum >= 10
      score + pins.sum
    }
  end

  private
  def finish?
    (@frames.length == 10 and !spare?(@frames.last) and !strike?(@frames.last) and @frames.last.length == 2) or \
    (@frames.length == 11 and @frames.last.length == 2) or \
    (@frames.length == 11 and @frames.last.length == 1 and spare?(@frames[-2])) or \
    (@frames.length == 12)
  end

  def spare?(frame)
    frame.length == 2 and frame.sum == 10
  end

  def strike?(frame)
    frame == [10]
  end
end