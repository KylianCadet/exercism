module BookStore
  PRICE = 8.00
  DISCOUNT = {
    1 => 0,
    2 => 0.05,
    3 => 0.10,
    4 => 0.20,
    5 => 0.25
  }.freeze

  def self.calculate_price(basket)
    (0..5).map {|i|
      group_books(basket, i)
      .map{|books| calculate_books_price(books.length)}
      .sum
    }.min
  end

  private
  def self.group_books(basket, size)
    basket
    .chunk{|el| el}
    .map{|_,chunk| chunk}
    .sort_by(&:length) # Assure the more repetitive books are placed at start
    .reverse
    .flatten
    .inject([]) {|groups, book|
      group_index = groups.find_index {|group| !group.include?(book) && group.length <= size}
      groups << [] if group_index.nil?
      group_index = groups.length - 1 if group_index.nil?
      groups[group_index] << book
      groups
    }
  end

  def self.calculate_books_price(n)
    n * (PRICE - PRICE * DISCOUNT[n])
  end
end
