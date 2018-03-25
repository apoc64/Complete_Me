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
  end # test exist

  def test_it_can_insert
    node = Node.new

    node.insert("A")
    actual = node.children[0].character
    assert_equal "A", actual
    node.insert("B")
    actual = node.children[1].character
    assert_equal "B", actual
    actual = node.children.count
    assert_equal 2, actual
  end

  def test_insert_returns_node
    node = Node.new
    new_node = node.insert("A")
    assert_instance_of Node, new_node 
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
    # true should overwrite duplicated character
    actual = node.children[1].is_end
    assert_equal false, actual
    node.insert("B", true)
    actual = node.children[1].is_end
    assert_equal true, actual
    node.insert("B", false)
    actual = node.children[1].is_end
    assert_equal true, actual
  end

  def test_node_insert_is_case_insensitive
    node = Node.new
    node.insert("A")
    node.insert("a")
    actual = node.children.count
    assert_equal 1, actual
    node.insert("b")
    actual = node.children.count
    assert_equal 2, actual
    node.insert("B")
    actual = node.children.count
    assert_equal 2, actual
  end

  def test_it_can_return_ending_node
    node = Node.new
    # Text for cat
    node.insert("C")
    node2 = node.children[0]
    node2.insert("a")
    node3 = node2.children[0]
    node3.insert("t", true)
    node4 = node3.children[0]

    end_nodes = node.get_end_nodes
    assert_equal [node4], end_nodes
    assert_equal "T", end_nodes[0].character
  end

  def test_it_can_return_multiple_end_nodes
    node = Node.new
    # Text for cat, car, cart
    node.insert("C")
    node2 = node.children[0]
    node2.insert("a")
    node3 = node2.children[0]
    node3.insert("t", true)
    node4 = node3.children[0]
    node3.insert("r", true)
    node5 = node3.children[1]
    node5.insert("t", true)
    node6 = node5.children[0]

    end_nodes = node.get_end_nodes
    expected = [node4, node5, node6]
    assert_equal expected, end_nodes

    # text for cattle
    node4.insert("t")
    node7 = node4.children[0]
    node7.insert("l")
    node8 = node7.children[0]
    node8.insert("e", true)
    node9 = node8.children[0]
    # binding.pry
    end_nodes = node.get_end_nodes
    expected = [node4, node9, node5, node6]
    assert_equal expected, end_nodes
  end

end
