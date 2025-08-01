class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map{|item| item[:name]}.sort
  end

  def cheap
    @items.filter{|item| item[:price]<30}
  end

  def out_of_stock
    @items.filter{|item| item[:quantity_by_size].length == 0}
  end

  def stock_for_item(name)
    @items.select{|item| item[:name] == name}[0][:quantity_by_size]
  end

  def total_stock
    @items.map{|item| item[:quantity_by_size].map{|_,quantity| quantity}}.flatten.sum
  end

  private
  attr_reader :items
end
