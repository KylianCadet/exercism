module RotationalCipher
  def self.shift(char, key)
    return char if char =~ /[^A-Za-z]/

    char_ord = char =~ /[A-Z]/ ? 'A'.ord : 'a'.ord

    (((char.ord - char_ord + key) % 26) + char_ord).chr
  end

  def self.rotate(plaintext, key)
    plaintext.chars.map{|char| shift(char, key)}.join
  end
end
