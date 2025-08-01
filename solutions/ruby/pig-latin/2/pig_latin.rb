module PigLatin
  def self.translate(sentence)
    sentence.split.map{|word| translate_word(word)}.join(' ')
  end

  def self.translate_word(word)
    word.scan(/^(xr|yt|[aeiou])/) {return word + 'ay'}
    word.scan(/^(qu[aeiou])/) {return word[2..] + 'quay'}
    word.scan(/^([^aeio]u)/) {return word[1..] + 'ray'}
    word.scan(/^([^aeiou]+|.)y(.*)/) {return "y#{$2}#{$1}ay"}
    word.scan(/^(th[^aeiou]+)(.*)/) {return "#{$2}#{$1}ay"}
    word.scan(/^([^aeio]+)(.*)/) {return "#{$2}#{$1}ay"}
  end
end
