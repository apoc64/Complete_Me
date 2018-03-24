class Node
  def initialize(character = nil) #should default be ""?
    @character = character
    @children = []
    @is_end = false
    @parent = nil
    @weight = 0
  end
end
