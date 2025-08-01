module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS === rank and FILES === file
  end

  def self.nick_name(first_name, last_name)
    "#{first_name[0..1].upcase}#{last_name[-2..-1].upcase}"
  end

  def self.move_message(first_name, last_name, square)
    return "#{nick_name(first_name, last_name)} attempted to move to #{square}, but that is not a valid square" unless valid_square?(*translate_square(square))

    return "#{nick_name(first_name, last_name)} moved to #{square}"
  end

  private
  def self.translate_square(square)
    rank = square[1].to_i
    file = square[0].upcase
    return [rank, file]
  end
end
