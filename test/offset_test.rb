require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_squared_date
    assert_equal 4, @offset.squared_date.length
  end

  def test_it_formats_a_date
    assert_instance_of Hash, @offset.assign_offsets
  end

end
