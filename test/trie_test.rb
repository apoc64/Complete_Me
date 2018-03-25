require_relative "../lib/complete_me"
require 'pry'
require "Minitest/autorun"
require "Minitest/pride"

class CompleteMeTest < Minitest::Test

  def setup
  end

  def test_it_exists
    complete_me = CompleteMe.new
    assert_instance_of CompleteMe, complete_me
  end

  def test_include_word?
    complete_me = CompleteMe.new
    assert complete_me.include_word?("")
    word = 'phrase'
    complete_me.insert(word)
    assert complete_me.include_word?(word)
    refute complete_me.include_word?('something')
    binding.pry
    complete_me.insert("cat")
    complete_me.insert("cattle")
    assert complete_me.include_word?("cat")
    # assert complete_me.include_word?("cattle")

  end

  def test_it_splits_words
    complete_me = CompleteMe.new
    assert_equal ["w","o","r","d"], complete_me.split_word("word")
    assert_equal [], complete_me.split_word("")
    assert_equal ["w"], complete_me.split_word("w")
  end

  def test_it_inserts
    complete_me = CompleteMe.new
    word = "phrase"
    complete_me.insert(word)
    # binding.pry
    assert complete_me.include_word?(word)
  end

end
