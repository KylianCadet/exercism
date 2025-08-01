module Pangram
  def self.pangram?(sentence)
    sentence.downcase.gsub(/[^a-z]/,'').chars.uniq.length == 26
  end
end