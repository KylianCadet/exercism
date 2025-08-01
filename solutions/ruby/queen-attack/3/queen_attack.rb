class Piece
  attr_accessor :row, :column

  def initialize(row, column)
    @row = row
    @column = column

    raise ArgumentError.new() unless valid?
  end

  def valid?
    @row.between?(0, 7) and @column.between?(0, 7)
  end
end

class Queens
  def initialize(white:nil, black:nil)
    @white = Piece.new(*white) if white
    @black = Piece.new(*black) if black
  end

  def attack?
    raise ArgumentError.new() if @white.nil? or @black.nil?

    @white.row == @black.row or \
    @white.column == @black.column or \
    (@white.column - @black.column).abs == (@white.row - @black.row).abs

  end
end