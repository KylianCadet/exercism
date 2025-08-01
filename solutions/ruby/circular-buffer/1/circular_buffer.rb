class CircularBuffer
  class BufferEmptyException < StandardError
  end
  class BufferFullException < StandardError
  end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException.new() if @buffer.empty?

    @buffer.shift
  end

  def write(el)
    raise BufferFullException.new() if full?

    @buffer << el
  end

  def write!(el)
    @buffer.shift if full?
    write(el)
  end


  def clear
    @buffer = []
  end

  private
  def full?
    @buffer.length == @size
  end
end