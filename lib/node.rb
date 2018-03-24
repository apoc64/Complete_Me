class Node
  attr_reader :children,
              :character


  def initialize(character = "") #should default be ""?
    @character = character
    @children = []
    @is_end = false
    @parent = nil
    @weight = 0
  end

  def insert(character)
    node = Node.new(character)
    @children << node
  end



end
