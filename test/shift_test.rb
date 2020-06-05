

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

  def test_square_date
    assert_equal 1_672_401_025, @shift.square_date("040895")
  end

  def test_offset
    assert_equal [1, 0, 2, 5], @shift.offset("040895")
  end

  def test_for_shift_values
    assert_equal [3, 27, 73, 20], @shift.shift_values("02715", "040895")
  end
end
