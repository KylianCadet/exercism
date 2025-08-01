COLOR = {
  :BLACK => 0,
  :BROWN => 1,
  :RED => 2,
  :ORANGE => 3,
  :YELLOW => 4,
  :GREEN => 5,
  :BLUE => 6,
  :VIOLET => 7,
  :GREY => 8,
  :WHITE => 9
}

module ResistorColorDuo
  def self.value(colors)
    colors.take(2).map{|color| color.upcase.to_sym}.map(&COLOR).join.to_i
  end
end