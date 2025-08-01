class Cipher
  attr_reader :key

  def initialize(key='aaaaaaaaaa')
    raise ArgumentError.new() if key =~ /[^a-z]/ || key.empty?
    @key = key
  end

  def shift(char, key, &block)
    char_ord = char.ord - 'a'.ord
    key_ord = key.ord - 'a'.ord
    new_ord = block.call(char_ord, key_ord)
    (new_ord % 26 + 'a'.ord).chr
  end

  def encode(plaintext)
    cipher(plaintext, &:+)
  end

  def decode(plaintext)
    cipher(plaintext, &:-)
  end

  private
  def cipher(plaintext, &block)
    plaintext.chars.map.with_index{|c, index|
      key = @key[index % @key.length]
      shift(c, key, &block)
    }.join
  end
end