class Minesweeper
  def self.annotate(field)
    field.map.with_index {|row, y|
      row.chars.map.with_index {|cell, x|
        next 'B' if cell == '*'
        [0,1,-1].repeated_permutation(2).map{|px, py|
          next nil if px == 0 && py == 0
          px += x
          py += y
          px.between?(0, row.length - 1) && py.between?(0, field.length - 1) ? field[py][px] : nil
        }
        .compact
        .inject(0) {|sum, cell| sum + (cell == '*' ? 1 : 0)}
      }
      .join
      .gsub(/0/, ' ')
      .gsub(/B/, '*')
    }
  end
end
