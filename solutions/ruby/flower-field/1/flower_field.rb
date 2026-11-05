class FlowerField
  def self.annotate(rows)
    rows.each_with_index.map{|row,y|
      row.chars.each_with_index.map{|c,x|
        next c if c == '*'
        fcount = [0,1,-1].repeated_permutation(2).inject(0) {|acc, (a, b)|
          next acc if a.zero? && b.zero?
          next acc if y.zero? && a == -1
          next acc if y == rows.length - 1 && a == 1
          next acc if x.zero? && b == -1
          next acc if x == rows[0].length - 1 && b == 1
          acc += 1 if rows[y+a][x+b] == '*'
          acc
        }
        fcount > 0 ? fcount : c
      }.join
    }
  end
end
