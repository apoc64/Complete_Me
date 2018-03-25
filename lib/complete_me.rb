require './lib/node.rb'

class CompleteMe
  attr_reader :root
  def initialize
    @root = Node.new
  end

  # def include_word?(word, node = @root)
  #   letters = word.split('')
  #   letters.each do |letter|
  #     if node.children_dont_have_character(letter)
  #       return false
  #     else
  #       node.children.each do |child_node|
  #       if include_word?(word, child_node)
  #
  #     end
  # end

  def split_word(word)
    letters = word.split('')
  end

  def insert(word)
    letters = split_word(word)
    letters.each do |letter|
      if letter.index == letters[-1].index
        node.insert(letter, true)
      else
        node.insert(letter)
      end
    end
  end


end
