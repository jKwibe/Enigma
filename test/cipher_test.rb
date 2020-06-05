
require_relative "./helper"
require "./lib/cipher"

class CipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_has_all_characters
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cipher.characters
  end

  def test_cipher_has_shited_values
    assert_equal [3, 27, 73, 20], @cipher.shift_values("02715", "040895")
  end
end
