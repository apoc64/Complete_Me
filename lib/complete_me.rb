require './lib/node.rb'

class CompleteMe
  attr_reader :root
  def initialize
    @root = Node.new
  end


  def include_word?(word, node = @root)
    nodes = node.get_end_nodes
    all_words = nodes.map do |end_node|
      end_node.to_s
    end
    if all_words.include?(word.downcase)
      return true
    else
      return false
    end
  end

  def split_word(word)
    letters = word.split("")
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

  #words is an array of words
  def insert_words(words)
    words.each do |word|
      insert(word)
    end
  end

  # file is a string of newline seperated words
  def populate(file)
    words = file.split("\n")
    insert_words(words)
  end

  def suggest(substring, node = @root)
    nodes = node.get_end_nodes
    sorted_nodes = nodes.sort_by {|node| node.weight}
    all_words = sorted_nodes.map do |end_node|
      end_node.to_s
    end
    possible_words = all_words.find_all {|word| word.index(substring) == 0 }
  end
end
