require 'pry'
require_relative '../lib/node.rb'
require 'CSV'

class CompleteMe
  attr_reader :root
  def initialize
    @root = Node.new
  end

  #returns the end node of a string if it is present in the trie
  def find(word, node = @root)
    new_node = nil
    word.each_char do |char|
      new_node = node.find_child_node(char)
      if new_node == nil
        return nil
      end
      node = new_node
    end
    node
  end

  def include_word?(word, node = @root)
    node = find(word)
    return false if node.nil?
    return node.is_end
    # nodes = node.get_end_nodes
    # all_words = nodes.map do |end_node|
    #   end_node.to_s
    # end
    # if all_words.include?(word.downcase)
    #   return true
    # else
    #   return false
    # end
  end

  def insert(word, node = @root)
    letters = word.split("")
    letters.each_with_index do |letter, index|
      if index == word.length - 1
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

  def suggest(substring)
    node = find(substring)
    return [] if node == nil
    nodes = node.get_end_nodes
    if include_word?(substring)
      nodes << node
    end
    sorted_nodes = sort_nodes(nodes, node.suggestions)
    sorted_nodes.map do |end_node|
      end_node.to_s
    end
  end

  def sort_nodes(nodes, suggestions)
    alphabetized = nodes.sort_by {|node| node.to_s}
    weighted = alphabetized.sort_by {|node| -node.weight}
    weighted.sort_by do |node|
      if suggestions[node].nil?
        suggestions[node] = 0
      end
      -suggestions[node]
    end
  end

  def count(node = @root)
   nodes = node.get_end_nodes.count
   nodes
  end

  def select(substring, string)
    sub_node = find(substring)
    word_node = find(string)
    word_node.weight += 1

    if sub_node.suggestions.include?(word_node)
      weight = sub_node.suggestions[word_node]
      weight += 1
      sub_node.suggestions[word_node] = weight
    else
      sub_node.suggestions[word_node] = 1
    end
  end

  def delete(word)
    node = find(word)
    return nil if node.nil? || !node.is_end
    node.is_end = false
    return 0 if node.get_end_nodes.count > 0
    delete_parent_nodes(node.parent, node)
  end

  def delete_parent_nodes(node, child)
    node.children.delete(child)
    return 1 if node.is_end
    return 2 if node.get_end_nodes.count > 0
    delete_parent_nodes(node.parent, node)
  end
  def parse(csv)
    addresses = []
    CSV.foreach(csv) do |row|
      addresses << row[20]
    end
    addresses.delete_at(0)
    addresses
  end

end
