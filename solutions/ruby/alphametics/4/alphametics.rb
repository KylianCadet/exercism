class Alphametics
  def self.translate_word(word, translation_hash)
    word
      .reverse
      .chars
      .map
      .with_index {|char, index| translation_hash[char] * (10 ** index)}
      .sum
  end

  def self.valid?(puzzle, translation_hash)
    return false if @left_words.any? {|word| translation_hash[word[0]] == 0} || translation_hash[@right[0]] == 0

    left_sum = @left_words.map{|word| translate_word(word, translation_hash)}.sum
    right_sum = translate_word(@right, translation_hash)
    
    left_sum == right_sum
  end

  def self.solve(puzzle)
    raise ArgumentError.new() if puzzle =~ /^[^A-Z=\+ ]$/
    letters = puzzle.chars.grep(/[A-Z]/).uniq
    raise ArgumentError.new('More than 10 different letters') if letters.length > 9

    left, right = puzzle.split('==').map(&:strip)
    @left_words = left.split('+').map(&:strip)
    @right = right

    (0..9)
    .to_a
    .permutation(letters.length).each do |numbers|
      translation_hash = letters.map.with_index{|letter, index| [letter, numbers[index]]}.to_h
      if valid?(puzzle, translation_hash)
        return translation_hash
      end
    end
    {}
  end
end