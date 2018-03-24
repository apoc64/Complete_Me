class Node
  attr_reader :children,
              :character,
              :parent

  attr_accessor :is_end


  def initialize(character = "", parent = nil, is_end = false) #should default be ""? is_end = false? parent = nil
    @character = character
    @children = []
    @is_end = is_end
    @parent = parent
    @weight = 0
  end

  def insert(character, is_end = false) #is_end = false?
    if children_dont_have_character(character)
      node = Node.new(character, self, is_end)
      @children << node
    elsif is_end
      change_node_is_end(character)
    end
  end

  def children_dont_have_character(character)
    if find_child_node(character).nil?
      return true
    else
      return false
    end
  end

  def change_node_is_end(character)
    find_child_node(character).is_end = true
  end

  def find_child_node(character)
    @children.each do |child|
      if child.character == character
        return child
      end
    end
    return nil 
  end



  # #tells me whther or not a node is an end node
  # def terminal?
  #   if self.

end
