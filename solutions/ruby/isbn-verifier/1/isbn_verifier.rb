module IsbnVerifier
  def self.valid?(number)
    number.gsub!(/-/,'')
    return false unless number =~ /^\d{9}[\dX]$/

    sum = number
    .chars
    .map {|char|
      next 10 if char == 'X'
      char.to_i
    }
    .each_with_index
    .inject(0) {|sum, (digit, index)|
      sum + (digit * (10 - index))
    }

    (sum % 11).zero?
  end
end
