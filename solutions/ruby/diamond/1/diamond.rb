module Diamond
  A_ORD = 'A'.ord

  def self.make_diamond(char)
    height = char.ord - A_ORD + 1
    lines = []
    height.times {|i|
      line = ''
      line << ' '*(height-i-1)
      line << to_char(i)
      line << " "*[(i-1)*2+1, 0].max
      line << to_char(i) unless i.zero?
      line << ' '*(height-i-1)
      line << "\n"
      lines << line
    }
    lines << lines.reverse[1..]
    lines.join
  end

  def self.to_char(number)
    (A_ORD + number).chr
  end
end
