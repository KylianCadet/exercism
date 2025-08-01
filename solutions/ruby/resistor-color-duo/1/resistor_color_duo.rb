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
    a,b,*c = colors.map{|color| COLOR[color.upcase.to_sym]}
    a*10+b
  end
end