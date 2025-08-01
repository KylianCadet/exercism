class Node
  attr_accessor :value, :left, :right, :up

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
    @left.up = self if @left
    @right.up = self if @right
  end

  def set_value(value)
    @value = value
    self
  end

  def set_left(node)
    @left = node
    @left.up = self if @left
    self
  end

  def set_right(node)
    @right = node
    @right.up = self if @right
    self
  end

  def to_tree
    node = self
    node = node.up while !node.up.nil?
    node
  end

  def ==(other)
    @value == other.value && \
    @left == other.left && \
    @right == other.right
  end
end

class Zipper < Node
  def initialize(value, left, right)
    super(value, left, right)
  end

  def self.from_tree(node)
    Zipper.new(node.value, node.left, node.right)
  end
end
