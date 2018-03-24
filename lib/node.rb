class Node
  attr_reader :children,
              :character


  def initialize(character = "") #should default be ""? is_end = false?
    @character = character
    @children = []
    @is_end = false
    @parent = nil
    @weight = 0
  end

  def insert(character) #is_end = false?
    if children_dont_have_character(character)
      node = Node.new(character)
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
