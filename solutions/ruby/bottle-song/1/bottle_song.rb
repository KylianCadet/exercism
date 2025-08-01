NUMS = %w[no one two three four five six seven eight nine ten].freeze

module BottleSong
  def self.recite_one(n)
    <<~TEXT
      #{NUMS[n].capitalize} green bottle#{n == 1 ? '' : 's'} hanging on the wall,
      #{NUMS[n].capitalize} green bottle#{n == 1 ? '' : 's'} hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be #{NUMS[n - 1]} green bottle#{n == 2 ? '' : 's'} hanging on the wall.
    TEXT
  end

  def self.recite(start, n)
    n.times.inject([]) {|acc, curr|
      acc << self.recite_one(start - curr)
    }.join("\n")
  end
end