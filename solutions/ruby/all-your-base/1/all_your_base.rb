module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError.new("Wrong input base: #{input_base}") if input_base <= 1
    raise ArgumentError.new("Wrong output base: #{output_base}") if output_base <= 1
    raise ArgumentError.new("Negative digit") if digits.any?{|digit| digit < 0}
    raise ArgumentError.new("Invalid digit") if digits.any?{|digit| digit >= input_base}

    converted_digits = to_base(to_decimal(input_base, digits), output_base)
    converted_digits.length > 0 ? converted_digits : [0]
  end

  def self.to_decimal(input_base, digits)
    digits.reverse.map.with_index {|digit, index| digit * input_base ** index}.sum
  end

  def self.to_base(decimal, output_base)
    converted_digits = []

    while decimal > 0
      remainder = decimal % output_base
      converted_digits << remainder
      decimal /= output_base
    end

    converted_digits.reverse
  end
end