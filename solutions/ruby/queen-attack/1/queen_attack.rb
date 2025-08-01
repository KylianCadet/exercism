class Piece
  attr_accessor :row, :column

  def initialize(row, column)
    @row = row
    @column = column
  end

  def valid?
    @row.between?(0, 7) and @column.between?(0, 7)
  end
end

class Queens
  def initialize(white:nil, black:nil)
    if white
      @white = Piece.new(white[0], white[1])
      raise ArgumentError.new() unless @white.valid?
    end

    if black
      @black = Piece.new(black[0], black[1])
      raise ArgumentError.new() unless @black.valid?
    end
  end

  def attack?
    raise ArgumentError.new() if @white.nil? or @black.nil?

    @white.row == @black.row or \
    @white.column == @black.column or \
    (@white.column - @black.column).abs == (@white.row - @black.row).abs

  end
end