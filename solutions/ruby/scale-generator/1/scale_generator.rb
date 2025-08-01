class Scale
  CHROMATIC_SHARP = %w[A A# B C C# D D# E F F# G G#].cycle(2).to_a
  CHROMATIC_FLAT = %w[A Bb B C Db D Eb E F Gb G Ab].cycle(2).to_a

  SHARP_NOTES = %w[G D A E B F e b f# c# g# d#].to_a
  FLAT_NOTES = %w[F Bb Eb Ab Db Gb d g c f bb eb].to_a

  def initialize(note)
    @chromatic = FLAT_NOTES.include?(note) ? CHROMATIC_FLAT : CHROMATIC_SHARP
    @note = note.capitalize
  end

  def chromatic
    index = @chromatic.find_index(@note)
    @chromatic[index..index+11]
  end

  def interval(intervals)
    offset = 0
    index = @chromatic.find_index(@note)
    step = {
      'm'=> 1,
      'M'=> 2,
      'A'=> 3
    }

    [
      @note,
      *intervals.chars.map{|interval|
        offset += step[interval]
        note = @chromatic[index + offset]
        note
      }
    ]
  end
end