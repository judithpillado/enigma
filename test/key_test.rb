require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_randomize_numbers
    assert_equal 5, @key.randomize_numbers.length
  end

  def test_it_generates_keys
   assert_equal 4, @key.generate_keys.length
  end

end
