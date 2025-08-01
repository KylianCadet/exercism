module Alphametics
  def self.translate_puzzle(puzzle, translation_hash)
    translation_hash.each do |letter, number|
      puzzle = puzzle.gsub(letter, number.to_s)
    end
    puzzle
  end

  def self.valid?(translated_puzzle)
    return false if translated_puzzle =~ /\b0\B/ # leading 0 is invalid

    left, right = translated_puzzle.split('==').map(&:strip)
    left_sum = left.split('+').map(&:strip).map(&:to_i).sum

    left_sum == right.to_i
  end

  def self.solve(puzzle)
    raise ArgumentError.new() if puzzle =~ /^[^A-Z=\+ ]$/
    letters = puzzle.chars.grep(/[A-Z]/).uniq
    raise ArgumentError.new('More than 10 different letters') if letters.length > 9

    (0..9)
    .to_a
    .permutation(letters.length).each do |numbers|
      translation_hash = letters.map.with_index{|letter, index| [letter, numbers[index]]}.to_h
      translated_puzzle = translate_puzzle(puzzle, translation_hash)
      if valid? translated_puzzle
        return translation_hash
      end
    end
    {}
  end
end