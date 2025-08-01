class Sieve
  def initialize(n)
    @n = n
    self
  end

  def primes
    list = (0..@n).map{|_|true}.to_a

    (2..@n).each do |i|
      if list[i] == true
        (i**2..@n).step(i).each do |j|
          list[j] = false
        end
      end
    end

    list.each.with_index.reduce([]) {|acc, (value, index)|
      if value == true
        acc << index
      end
      acc
    }.drop(2)
  end
end