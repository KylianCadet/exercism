class Integer
  ROMANS = 'IVXLCDM__'.freeze
  GROUPED_ROMANS = ROMANS.chars.each_cons(3).to_a.select.with_index {|_, index| index % 2 == 0}.freeze

  def convert_group(number, group)
    unit, half, next_unit = group
    case number
    when 1..3
      unit * number
    when 4
      unit + half
    when 5..8
      half + unit * (number - 5)
    when 9
      unit + next_unit
    else
      ''
    end
  end

  def to_roman
    self
    .to_s
    .chars
    .reverse
    .map(&:to_i)
    .zip(GROUPED_ROMANS)
    .map{|number, group| convert_group(number, group)}
    .reverse
    .join
  end
end
