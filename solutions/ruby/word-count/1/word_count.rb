class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.split(/[\n\s,]/)
      .map{|word| word.gsub(/[^\w']|^'|'$/,'').downcase }
      .filter{|word| !word.empty?}
      .reduce({}) { |acc, word| {**acc, word => (acc[word] or 0) + 1 } }
  end
end