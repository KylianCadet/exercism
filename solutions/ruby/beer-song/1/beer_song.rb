module BeerSong
  def self.recite(bottle, step)
    res = ''
    step.times.each{|i|
      res << verse(bottle)
      if i != step - 1
        res << "\n"
      end
      bottle -= 1
    }
    res
  end

  def self.verse(bottle)
    "#{first_sentence(bottle)}\n#{last_sentence(bottle)}\n"
  end

  private
  def self.bottle_text(bottle)
    return 'no more bottles' if bottle == 0
    "#{bottle} bottle#{bottle > 1 ? 's': ''}"
  end

  def self.no_more
    'Go to the store and buy some more, 99 bottles of beer on the wall.'
  end

  def self.first_sentence(bottle)
    "#{bottle_text(bottle).capitalize} of beer on the wall, #{bottle_text(bottle)} of beer."
  end

  def self.last_sentence(bottle)
    return no_more if bottle <= 0
    "Take #{bottle == 1 ? 'it' : 'one'} down and pass it around, #{bottle_text(bottle - 1)} of beer on the wall."
  end
end