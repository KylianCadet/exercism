class Affine
  ALPHABET = ('a'..'z').to_a.freeze
  M = ALPHABET.length

  def initialize(a, b)
    raise ArgumentError.new("Not coprime") if a.gcd(M) != 1

    @a = a
    @b = b
    @a_mmi = mmi(a, M)
  end

  def encode(plaintext)
    plaintext
    .downcase
    .gsub(/[^a-z\d]/, '')
    .chars
    .map{|char|
      next char if char =~ /\d/
      a_ord = 'a'.ord
      (((@a * (char.ord - a_ord) + @b) % M) + a_ord).chr
    }
    .each_slice(5)
    .map(&:join)
    .join(' ')
  end

  def decode(ciphertext)
    ciphertext
    .gsub(/\s/, '')
    .chars
    .map{|char|
      next char if char =~ /\d/
      a_ord = 'a'.ord
      ((@a_mmi * ((char.ord - a_ord) - @b) % M) + a_ord).chr
    }
    .join
  end

  private
  def mmi(number, m)
    x = 1
    x += 1 while number * x % m != 1
    x
  end
end