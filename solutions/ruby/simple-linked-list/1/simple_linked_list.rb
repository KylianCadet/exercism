class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(elements=[])
    @elements = []
    elements.each{|element|
      push(Element.new(element))
    }
  end

  def push(element)
    @elements << element
    self
  end

  def pop
    @elements.pop
  end

  def to_a
    @elements.reverse.map{|element| element.datum}
  end

  def reverse!
    @elements.reverse!
    self
  end
end