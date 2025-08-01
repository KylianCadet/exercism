class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  METRIX = ['', 'kilo', 'mega', 'giga'].freeze

  def initialize(colors)
    @colors = colors
  end

  def label
    value = @colors.take(2).map{|color| COLORS.index(color)}.join.to_i
    multipler = 10 ** COLORS.index(@colors[2])
    value *= multipler
    metrix_index = value.digits.length.pred / 3

    "Resistor value: #{value/(1000**metrix_index)} #{METRIX[metrix_index]}ohms"
  end
end