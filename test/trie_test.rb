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
end 
