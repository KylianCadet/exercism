LETTER_VALUE = {
  **'AEIOULNRST'.chars.map{|c| [c, 1]}.to_h,
  **'DG'.chars.map{|c| [c, 2]}.to_h,
  **'BCMP'.chars.map{|c| [c, 3]}.to_h,
  **'FHVWY'.chars.map{|c| [c, 4]}.to_h,
  **'K'.chars.map{|c| [c, 5]}.to_h,
  **'JX'.chars.map{|c| [c, 8]}.to_h,
  **'QZ'.chars.map{|c| [c, 10]}.to_h,
}.freeze

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    @word.upcase.chars.reduce(0) { |acc, letter| acc + LETTER_VALUE[letter] }
  end
end