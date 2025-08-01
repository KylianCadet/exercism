class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Bst < Node
  def initialize(root)
    super(root)
  end

  def insert(number, node=self)
    if node.data >= number
      if node.left.nil?
        node.left = Node.new(number)
      else
        return insert(number, node.left)
      end
    elsif node.data < number
      if node.right.nil?
        node.right = Node.new(number)
      else
        return insert(number, node.right)
      end
    end
  end

  def walk(node=self, &block)
    walk(node.left, &block) unless node.left.nil?
    yield node.data
    walk(node.right, &block) unless node.right.nil?
  end


  def each(node=self, &block)
    return walk(self, &block) if block_given?

    all_data = []
    walk() {|data|
      all_data << data
    }
    all_data.to_enum
  end
end