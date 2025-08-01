module RailFenceCipher
  def self.encode(str, rail_n)
    rails = rail_n.times.map{''}
    rail_index = 0
    up = false
    str.chars.each.with_index {|char, index|
      rails[rail_index] << char
      rail_index += up ? -1 : 1
      if rail_index < 0
        rail_index = 1
        up = false
      end
      if rail_index >= rail_n
        rail_index = rail_n - 2
        up = true
      end
    }
    rails.join
  end

  def self.decode(str, rail_n)
    return str if rail_n == 1 || str.empty?

    rails = rail_n.times.map{[]}
    x = 1
    while str.length > rail_n + (rail_n - 1) * x
      x += 1
    end
    y = rail_n + ((rail_n - 1) * x) - str.length

    _start = 0
    rail_n.times.each{|i|
      offset = _start
      case i
      when 0
        offset = (x + 1).fdiv(2).ceil
      when rail_n - 1
        offset = rail_n - i > y ? (x + 1).fdiv(2).ceil : (x + 1).fdiv(2).ceil - 1
      else
        offset = rail_n - i > y ? (x+1) : x
      end
      str[_start...(_start+offset)].chars.each{|c| rails[i] << c}
      _start+=offset
    }
    rails

    res = ''
    rail_index = 0
    up = false
    str.length.times.each {|i|
      res << rails[rail_index].shift
      rail_index += up ? -1 : 1
      if rail_index < 0
        rail_index = 1
        up = false
      end
      if rail_index >= rail_n
        rail_index = rail_n - 2
        up = true
      end
    }
    res
  end
end
