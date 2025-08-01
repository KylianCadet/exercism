class Palindromes
  class Elem
    attr_reader :value
    attr_accessor :factors

    def initialize(value, factors)
      @value = value
      @factors = [factors]
    end
  end


  def initialize(min_factor: nil, max_factor: nil)
    raise ArgumentError.new() if max_factor.nil?

    @min_factor = min_factor || 1
    @max_factor = max_factor
  end

  def palindrom?(number)
    number.digits == number.digits.reverse
  end

  def generate
    @palindromes = (@min_factor..@max_factor)
    .to_a
    .repeated_combination(2)
    .reduce([]) {|acc, (a,b)|
      number = a * b
      if palindrom?(number)
        elem_found = acc.find{|elem| elem.value == number }
        if elem_found
          elem_found.factors << [a,b]
        else
          acc << Elem.new(number, [a,b])
        end
      end
      acc
    }.sort_by(&:value)
  end

  def largest
    @palindromes.at(-1)
  end

  def smallest
    @palindromes.at(0)
  end
end