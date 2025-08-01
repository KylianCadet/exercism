class Deque
  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
      @next = nil
    end
  end

  def initialize
    @head = nil
  end

  def push(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      return self
    end
    last_node = last
    last_node.next = new_node
    self
  end

  def unshift(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      return self
    end
    head = @head
    new_node.next = head
    @head = new_node
    self
  end

  def last
    node = @head
    node = node.next until node.next.nil?
    node
  end

  def previous_last
    node = @head
    node = node.next until node.next.nil? || node.next.next.nil?
    node
  end

  def pop
    return nil if @head.nil?

    l = last
    previous_last.next = nil
    @head = nil if l == @head
    l.value
  end

  def shift
    return nil if @head.nil?

    first = @head
    @head = first.next unless first.nil?
    first.value or nil
  end
end