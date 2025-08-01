class ParallelLetterFrequency
  def self.count(texts)
    tally = Hash.new(0)
    texts.map{|text|
      Thread.new {
        text.downcase.gsub(/[^\p{L}a-z]/, '').each_char {|char|
          tally[char] += 1
        }
      }
    }.map &:join
    tally
  end
end