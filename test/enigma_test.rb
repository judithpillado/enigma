require './test/test_helper'
require 'time'
require './lib/key'
require './lib/offset'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_shifts
    assert_equal 4, @enigma.shifts(Key.new, Offset.new).length
  end

end
