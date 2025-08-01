class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.filter {|el|
      el.downcase.chars.sort == @word.downcase.chars.sort and
      el.downcase.chars != @word.downcase.chars
    }
  end
end