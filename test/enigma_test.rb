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
    Date.today.stubs(:strftime).returns("040620")
    assert_equal "040620", @enigma.date_gen
  end

  def test_generate_5_random_numbers
    @enigma.stubs(:gen_keys).returns("23456")
    assert_equal "23456", @enigma.gen_keys
  end
end
