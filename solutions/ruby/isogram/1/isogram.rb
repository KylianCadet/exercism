module Isogram
  def self.isogram?(word)
    word.downcase.gsub(/[\s-]/, '').chars.sort.each_cons(2).all? {|a, b| a != b}
  end
end
