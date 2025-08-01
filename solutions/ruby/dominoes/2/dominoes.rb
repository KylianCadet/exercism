module Dominoes
  def self.chain?(dominoes)
    return true if dominoes.empty?

    dominoes.permutation(dominoes.length).map {|dominoes|
      dominoes.map.with_index{|dominoe, index|
        next dominoe if index >= dominoes.length - 2
        next dominoe.reverse if dominoe[0] == dominoes[index+1][0]
        dominoe
      }.flatten
    }.any?{|chain| valid?(chain)}
  end

  def self.valid?(chain)
    chain[1...-1].each_slice(2).all?{|a, b| a - b == 0} && chain[0] == chain[-1]
  end
end
