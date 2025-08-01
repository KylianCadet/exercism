require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items.map{|item| OpenStruct.new(item)}
  end

  def item_names
    items.map {|item| item.name }.sort
  end

  def total_stock
    items.sum {|item| item.quantity_by_size.values.sum }
  end
end
