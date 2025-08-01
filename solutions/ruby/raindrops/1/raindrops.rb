module Raindrops
  def self.convert(drop_n)
    sound = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }.reduce('') { |acc, (k, v)|
      drop_n % k == 0 ? acc + v : acc
    }
    sound.empty? ? drop_n.to_s : sound
  end
end