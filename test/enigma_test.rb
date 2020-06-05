require "date"
require_relative "./helper"
require "./lib/enigma"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exist
    assert_instance_of Enigma, @enigma
  end

  def test_generate_time_string
    Date.stubs(:today).returns(Date.new(2020, 06, 05))
    assert_equal "050620", @enigma.date_gen
  end

  def test_generate_5_random_numbers
    @enigma.stubs(:gen_keys).returns("23456")
    assert_equal "23456", @enigma.gen_keys
  end

  def test_machine_can_encrypt
    Date.stubs(:today).returns(Date.new(2020, 06, 05))
    @enigma.stubs(:gen_keys).returns("23456")
    expected = {
                  :encryption=>"hpcnoknqrwv",
                  :key=>"23456",
                  :date=>"050620"
                }

    assert_equal expected, @enigma.encrypt("hello world")
  end
end
