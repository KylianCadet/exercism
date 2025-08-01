class Crypto
  def initialize(plaintext)
    @plaintext = normalize(plaintext)
  end

  def ciphertext
    return '' if @plaintext.empty?

    chunk_size = (@plaintext.length**0.5).ceil

    @plaintext
      .chars
      .each_slice(chunk_size)
      .to_a
      .map{|chunk|
        (chunk_size - chunk.length).times.each do |_|
          chunk << ' '
        end
        chunk
      }
      .transpose
      .map(&:join)
      .join(' ')
  end

  private
  def normalize(plaintext)
    plaintext.gsub(/\W/, '').downcase
  end
end
