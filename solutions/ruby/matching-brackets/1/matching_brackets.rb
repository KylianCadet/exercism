module Brackets
  def self.paired?(exp)
    exp.gsub!(/[^{}\[\]\(\)]/, '')
    reg = /{}|\[\]|\(\)/
    while exp =~ reg
      exp.gsub!(reg, '')
    end
    exp.empty?
  end
end