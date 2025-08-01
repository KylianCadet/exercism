class Change
  class NegativeTargetError < StandardError
  end
  class ImpossibleCombinationError < StandardError
  end

  def self.previous_coin(min_coin)
    @available_coins[@available_coins.index(@available_coins.find{|coin| coin == min_coin}) - 1]
  end

  def self.decompose(coins, &block)
    return if coins.min == @available_coins[0]

    min_coin = coins.min
    previous_coin = previous_coin(min_coin)
    min_count = coins.count(coins.min)

    if coins.sum + previous_coin > @amount # Insert new coin at the start
      biggest_coin = @available_coins.reverse.find{|coin| coins.sum + coin <= @amount }
      biggest_coin ||= @available_coins.at(-1)
      coins_dup = coins.dup
      coins_dup.insert(0, biggest_coin) while coins_dup.sum + biggest_coin <= @amount
      if coins_dup != coins
        yield coins_dup.dup
        decompose(coins_dup.dup, &block)
      end
    end

    min_count.times do # Replace each minimum values with the previous coin in the list
      coins.delete_at(coins.rindex(min_coin)) if coins.sum + previous_coin > @amount # Delete rightmost smallest value
      coins.insert(0, previous_coin) while coins.sum + previous_coin <= @amount # Insert at position 0 as many previous coin as possible
      yield coins.dup
      decompose(coins.dup, &block)
    end
  end

  def self.generate(available_coins, amount)
    return [] if amount.zero?
    raise NegativeTargetError.new() if amount < 0
    raise ImpossibleCombinationError.new() if amount < available_coins.min

    @available_coins = available_coins
    @amount = amount

    largest_coin = available_coins.reverse.find{|coin| coin <= amount}
    largest_coin ||= available_coins.at(-1)
    coins = [largest_coin] * [amount / largest_coin, 1].max

    return coins if coins.sum == amount

    enum_for(:decompose, coins.dup)
    .lazy
    .select{|coins| coins.sum == amount}
    .take(amount)
    .sort{|a, b| a.length - b.length}
    .at(0) or raise ImpossibleCombinationError.new()
  end
end
