class Node
  attr_reader :children,
              :character,
              :parent


  def initialize(character = "", parent = nil) #should default be ""? is_end = false? parent = nil
    @character = character
    @children = []
    @is_end = false
    @parent = parent
    @weight = 0
  end

  def insert(character) #is_end = false?
    if children_dont_have_character(character)
      node = Node.new(character, self)
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

end
