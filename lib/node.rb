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
    node = Node.new(character)
    @children << node
  end



end
