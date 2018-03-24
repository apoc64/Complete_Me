class Node
  attr_reader :children,
              :character,
              :parent,
              :is_end


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
    end
  end

  def children_dont_have_character(character)
    @children.each do |child|
      if child.character == character
        return false
      end
    end
    return true
  end



  # #tells me whther or not a node is an end node
  # def terminal?
  #   if self.

end
