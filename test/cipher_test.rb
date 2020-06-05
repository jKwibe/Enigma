
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

  def test_cipher_has_shifted_values
    assert_equal [3, 27, 73, 20], @cipher.shift_values("02715", "040895")
  end

  def test_cipher_has_encrpt_and_decrypt_messages
    encrypted = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    decrypted = {
              decryption: "hello world",
              key: "02715",
              date: "040895"
            }
    assert_equal encrypted, @cipher.encrypted_message("keder ohulw", "02715", "040895")
    assert_equal decrypted, @cipher.decrypted_message("hello world", "02715", "040895")
  end
end
