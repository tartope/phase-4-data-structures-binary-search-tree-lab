require_relative './node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  # BinarySearchTree#search: this method should take a target value as input and search for the Node with that value in the Tree instance. The method should return the Node with the target value if one is found and nil otherwise.
  def search(value)
    # your code here
    return nil if @root.nil?

    current = @root
    found = false

    while current && !found
      if value < current.value
        current = current.left
      elsif value > current.value
        current = current.right
      else
        found = true
      end
    end
    found ? current : nil
  end

  def insert(value)
    # your code here
    new_node = Node.new(value)
    if @root.nil?
      @root = new_node
      return @root
    end

    current = @root

    while current
      return nil if value == current.value

      if value < current.value
        if current.left.nil?
          current.left = new_node
          return current.left
        end
        current = current.left
      else
        if current.right.nil?
          current.right = new_node
          return current.right
        end
        current = current.right
      end
    end
  end

end 

# Some tips to get it working:

# You will need to use a variable to keep track of which node you’re currently checking.
# For the #search method, you will want to continue looping until you’ve either found the target node or you’ve run out of nodes to check. For the #insert method, you will want to continue looping until you’ve either inserted the new node or found that there is already a node in the tree that has the target value.
# Recall that you can use while true to continue looping until a return statement is executed.
