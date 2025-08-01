Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      item.sell_in -= 1

      if item.name =~ /Aged Brie/
        item.quality += 1 unless item.quality == 50
        item.quality += 1 if item.sell_in < 0 unless item.quality == 50
        item.quality = 0 if item.sell_in < 0 && item.name =~ /Conjured/
        next
      end

      if item.name =~ /Backstage passes to a TAFKAL80ETC concert/i
        quality = 1
        quality += 1 if item.sell_in < 10
        quality += 1 if item.sell_in < 5
        quality -= 1 if item.name =~ /Conjured/
        item.quality += quality
        item.quality = [item.quality, 50].min
        item.quality = 0 if item.sell_in < 0
        next
      end

      item.quality = 0 if item.sell_in < 0 && item.name =~ /Conjured/
      next if item.name =~ /Hand of Ragnaros/
      item.quality -= 1 unless item.quality.zero?
      item.quality -= 1 unless item.quality.zero? if item.sell_in < 0 
      item.quality -= 1 unless item.quality.zero? if item.name =~ /Conjured/
    end
  end
end

