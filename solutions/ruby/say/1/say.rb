class Say
  THOUSAND_LABEL = [nil, 'thousand', 'million', 'billion']
  NUMBERS = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety',
  }.freeze


  def initialize(number)
    raise ArgumentError.new() if number < 0 || number >= 1_000_000_000_000

    @number = number
  end

  def in_english
    number = @number.to_s
    len = number.length
    number = number.rjust(len + (3 - len) % 3, '0')

    number.scan(/.../).reverse.map.with_index{|block, index|
      next if block.to_i.zero? and (!index.zero? || number.length > 3)
      [tr_hundred(block.to_i), THOUSAND_LABEL[index]].compact.join(' ')
    }.reverse.join(' ').strip
  end

  private
  def tr_hundred(number)
    hundred = number / 100
    number %= 100
    ten = number / 10
    unit = number % 10

    hundred = nil if hundred.zero?
    ten = nil if ten.zero?
    unit = nil if unit.zero? && (!ten.nil? || !hundred.nil?)

    is_special_ten = !unit.nil? && !ten.nil? && !NUMBERS[ten * 10 + unit].nil?

    hundred_str = "#{NUMBERS[hundred]} hundred" unless hundred.nil?
    ten_str = NUMBERS[ten * 10 + unit] if is_special_ten # 11 / 12 / 13 cases
    ten_str ||= NUMBERS[ten * 10] unless ten.nil?
    unit_str = NUMBERS[unit] unless unit.nil? || is_special_ten

    if ten_str == NUMBERS[10] && !unit_str.nil? # teen cases
      unit_str = "#{unit_str}teen"
      ten_str = nil
    end

    [hundred_str, [ten_str, unit_str].compact.join('-')].compact.join(' ')
  end
end
