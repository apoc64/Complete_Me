require './lib/node.rb'

class CompleteMe
  attr_reader :root
  def initialize
    @root = Node.new
  end

  def include_word?(word, node = @root)
    letters = word.split('')
    letters.each do |letter|
      if node.children_dont_have_character(letter)
        return false
      else
        node = node.find_child_node(letter)
      end
      return true
    end
  end

  def split_word(word)
    letters = word.split('')
  end

  def insert(word, node = @root)
    letters = split_word(word)
    letters.each_with_index do |letter, index|
      if index == letters.index(letters[-1])
        node.insert(letter, true)
      else
        node = node.insert(letter)
      end
    end
  end


end
