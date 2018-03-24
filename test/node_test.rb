require_relative "../lib/node"
require 'pry'
require "Minitest/autorun"
require "Minitest/pride"

class NodeTest < MiniTest::Test
  def setup
  end

  def test_it_exists
    node = Node.new
    assert_instance_of Node, node
  end#test exist

  def test_it_can_insert
    node = Node.new

    node.insert("A")
    # binding.pry
    actual = node.children[0].character
    assert_equal "A", actual
    node.insert("B")
    actual = node.children[1].character
    assert_equal "B", actual
    actual = node.children.count
    assert_equal 2, actual

  end

  def test_it_does_not_duplicate_characters
    node = Node.new
    node.insert("A")
    actual = node.children[0].character
    assert_equal "A", actual
    actual = node.children.count
    assert_equal 1, actual

    node.insert("A")
    actual = node.children[0].character
    assert_equal "A", actual
    actual = node.children.count
    assert_equal 1, actual
    refute actual > 1

    node.insert("B")
    actual = node.children[1].character
    assert_equal "B", actual
    actual = node.children.count
    assert_equal 2, actual
    refute actual > 2

    node.insert("B")
    actual = node.children[1].character
    assert_equal "B", actual
    actual = node.children.count
    assert_equal 2, actual
    refute actual > 2

    node.insert("A")
    actual = node.children[0].character
    assert_equal "A", actual
    actual = node.children.count
    assert_equal 2, actual
    refute actual > 2
  end

  def test_children_can_have_parent
    node = Node.new
    node.insert("A")
    child = node.children[0]
    assert_equal node, child.parent
  end

  def test_node_can_be_end_of_word
    node = Node.new
    node.insert("A")
    actual = node.children[0].is_end
    assert_equal false, actual

    node.insert("B", true)
    actual = node.children[1].is_end
    assert_equal true, actual
  end

  def test_end_of_word_overwrites_duplicate_node
    node = Node.new
    node.insert("A")
    node.insert("B")
    node.insert("A", true)
    actual = node.children[0].is_end
    assert_equal true, actual
    #true should overwrite duplicated character
    actual = node.children[1].is_end
    assert_equal false, actual
    node.insert("B", true)
    actual = node.children[1].is_end
    assert_equal true, actual
    node.insert("B", false)
    actual = node.children[1].is_end
    assert_equal true, actual
  end

end
