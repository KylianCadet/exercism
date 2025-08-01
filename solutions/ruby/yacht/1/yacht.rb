class Yacht
  attr_reader :score

  def initialize(scores, category)
    @score = case category
    when 'ones' then scores.select{|score| score == 1}.sum
    when 'twos' then scores.select{|score| score == 2}.sum
    when 'threes' then scores.select{|score| score == 3}.sum
    when 'fours' then scores.select{|score| score == 4}.sum
    when 'fives' then scores.select{|score| score == 5}.sum
    when 'sixes' then scores.select{|score| score == 6}.sum
    when 'full house' then scores.tally.values.sort == [2, 3] ? scores.sum : 0
    when 'four of a kind' then scores.tally.values.sort.last >= 4 ? scores.tally.select{|k,v| v >= 4}.keys[0] * 4 : 0
    when 'little straight' then scores.sort == [1,2,3,4,5] ? 30 : 0
    when 'big straight' then scores.sort == [2,3,4,5,6] ? 30 : 0
    when 'choice' then scores.sum
    when 'yacht' then scores.all? {|score| score == scores[0]} ? 50 : 0
    end
  end
end
