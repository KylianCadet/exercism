module Atbash
  ALPHABET = ('a'..'z').to_a.join.freeze
  TRANSLATE = [ALPHABET, ALPHABET.reverse].freeze

  def self.encode(plaintext)
    plaintext.downcase.gsub(/[^a-z1-9]/, '').tr(ALPHABET, ALPHABET.reverse).chars.each_slice(5).map(&:join).join(' ')
  end

  def self.decode(ciphertext)
    ciphertext.gsub(/\s/, '').tr(ALPHABET.reverse, ALPHABET)
  end
end
