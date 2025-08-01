class Card
  attr_reader :rank, :suit, :score

  SUITS = %i"D C H S"
  RANKS = %i"1 2 3 4 5 6 7 8 9 10 J Q K A"

  def initialize(rank, suit)
    @rank = rank.to_sym
    @suit = suit.to_sym
    @score = RANKS.index(@rank)

    raise ArgumentError.new() if @rank <=> RANKS or @suit <=> SUITS
  end

  def to_s
    "#{@rank.to_s}#{@suit.to_s}"
  end

end

class Hand
  attr_reader :score

  HAND_CATEGORY = {
    :high_card => -> (cards) { true },
    :one_pair => -> (cards) { pair?(cards, 1) },
    :two_pair => -> (cards) { pair?(cards, 2) },
    :three_of_a_kind => -> (cards) { same_kind?(cards, 3) },
    :straight => -> (cards) { sequence?(cards) },
    :flush => -> (cards) { same_suit?(cards) },
    :full_house => -> (cards) { same_kind?(cards, 3) and pair?(cards, 1) },
    :four_of_a_kind => -> (cards) { same_kind?(cards, 4) },
    :straight_flush => -> (cards) { sequence?(cards) and same_suit?(cards) }
  }

  def initialize(cards)
    @cards = cards
    category = HAND_CATEGORY.filter_map.with_index{|(key, value), index|
      index if value.call(cards) == true
    }.reverse.at(0)
    grouped_cards = cards.map(&:score).sort.chunk{|score| score}.map{|_,scores| scores}
    same_kind = 4.downto(2).map{|i|
      grouped_cards.select{|cards| cards.length == i}.flatten.sort.reverse
    } # [[2,2,2,2],[2,2,2],[2,2]]
    single = grouped_cards.select{|cards| cards.length == 1}.flatten.sort.reverse

    if Hand.low_ace_sequence?(cards)
      single = [1] + single[...-2] # Ace value is 1 when used in a sequence
    end

    @score = [category, *same_kind, *single]
  end

  def to_s
    @cards.map(&:to_s)
  end

  private
  def self.pair?(cards, n)
    cards.map(&:rank).tally.filter{|_,n| n == 2}.length == n
  end

  def self.same_kind?(cards, recurrence)
    cards.map(&:rank).tally.filter{|_,n| n == recurrence}.length >= 1
  end

  def self.sequence?(cards)
    cards
    .map(&:rank)
    .sort_by{|rank| Card::RANKS.index(rank)}
    .each_cons(2)
    .all?{|prank, rank| Card::RANKS.index(rank) - Card::RANKS.index(prank) == 1} or \
    low_ace_sequence?(cards)
  end

  def self.low_ace_sequence?(cards)
    cards
    .map(&:rank)
    .sort_by{|rank| Card::RANKS.index(rank)} == %i"2 3 4 5 A"
  end

  def self.same_suit?(cards)
    cards.map(&:suit).all?{|suit| suit == cards[0].suit}
  end
end

class Poker
  def initialize(hands)
    @hands = hands.map{|hands|
      Hand.new(hands.map{|card|
        *rank, suit = card.chars
        Card.new(rank.join, suit)
      })
    }
  end

  def best_hand
    sorted_hands = @hands.sort_by(&:score).reverse
    sorted_hands
    .filter{|hand| hand.score == sorted_hands[0].score}
    .map(&:to_s)
    .reverse # re-reverse to keep order of hands
  end
end