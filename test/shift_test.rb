

require_relative "./helper"
require "./lib/shift"

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_find_all_keys
    assert_equal [2, 27, 71, 15], @shift.keys("02715")
  end


end
