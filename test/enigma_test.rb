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

  end
end
# Time.now.strftime("%d%m%y")
