module OcrNumbers
  NUMBERS = [
    [
      " _ ",
      "| |",
      "|_|",
      "   "
    ], [
      "   ",
      "  |",
      "  |",
      "   "
    ], [
      " _ ",
      " _|",
      "|_ ",
      "   "
    ], [
      " _ ",
      " _|",
      " _|",
      "   "
    ], [
      "   ",
      "|_|",
      "  |",
      "   "
    ], [
      " _ ",
      "|_ ",
      " _|",
      "   "
    ], [
      " _ ",
      "|_ ",
      "|_|",
      "   "
    ], [
      " _ ",
      "  |",
      "  |",
      "   "
    ], [
      " _ ",
      "|_|",
      "|_|",
      "   "
    ], [
      " _ ",
      "|_|",
      " _|",
      "   "
    ]
  ].freeze

  def self.convert_line(grid)
    grid
    .map(&:chars)
    .map{|chars| chars.each_slice(3)}
    .map(&:to_a)
    .transpose
    .map{|blocks| blocks.map(&:join)}
    .map{|block| NUMBERS.index(block) or '?'}
    .join
  end

  def self.convert(grid)
    raise ArgumentError.new() unless (grid.lines.length % 4).zero?
    raise ArgumentError.new() unless (grid.split("\n").at(0).length % 3).zero?

    grid
    .split("\n")
    .each_slice(4)
    .to_a
    .map{|grid| convert_line(grid)}
    .join(',')
  end
end
