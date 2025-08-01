module PigLatin
  def self.translate(sentence)
    sentence.split.map{|word| translate_word(word)}.join(' ')
  end

  def self.translate_word(word)
    word.scan(/^(xr|yt|[aeiou])/) {|_| return word + 'ay'}
    word.scan(/^(qu[aeiou])/) {|_| return word[2..] + 'quay'}
    word.scan(/^([^aeio]u)/) {|_| return word[1..] + 'ray'}
    word.scan(/^([^aeiou]+y|.y)/) {|c| return word[word.index('y')..] + word[...word.index('y')] + 'ay'}
    word.scan(/^(th[^aeiou]+)/) {|c| return word.gsub(/^th[^aeiou]+/,'') + c.join + 'ay'}
    word.scan(/^([^aeio]+)/) {|c| return word.gsub(/^[^aeio]+/,'') + c.join + 'ay'}
  end
end
