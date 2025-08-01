module Luhn
  def self.valid?(num)
    num = num.gsub(/\s/,'')
    return false if num.length <= 1 or num.match(/[^\d]/)
    num.chars
        .map(&:to_i)
        .reverse
        .map
        .with_index {|n, index| index % 2 == 0 ? n : n * 2}
        .map {|n| n > 9 ? n - 9 : n}
        .sum % 10 == 0
  end
end