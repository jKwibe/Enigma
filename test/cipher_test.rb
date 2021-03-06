
require_relative "./helper"
require "./lib/cipher"

class CipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_generate_time_string
    Date.stubs(:today).returns(Date.new(2020, 06, 05))
    assert_equal "050620", @cipher.date_gen
  end

  def test_generate_5_random_numbers
    @cipher.stubs(:gen_keys).returns("23456")
    assert_equal "23456", @cipher.gen_keys
  end

  def test_cipher_has_all_characters
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cipher.characters
  end

  def test_cipher_has_shifted_values
    assert_equal [3, 27, 73, 20], @cipher.shift_values("02715", "040895")
  end

  def test_cipher_can_group_encription_shifted_values
    expected = { "a"=>"d","b"=>"e","c"=>"f","d"=>"g","e"=>"h","f"=>"i",
      "g"=>"j","h"=>"k","i"=>"l","j"=>"m","k"=>"n","l"=>"o",
      "m"=>"p","n"=>"q","o"=>"r","p"=>"s","q"=>"t","r"=>"u",
      "s"=>"v","t"=>"w","u"=>"x","v"=>"y","w"=>"z","x"=>" ",
      "y"=>"a","z"=>"b"," "=>"c"}
    assert_equal expected, @cipher.encrypt_shift_matches("02715", "040895")
  end

  def test_cipher_can_group_decryption_shifted_values
    expected = {
      "a"=>"y", "b"=>"z", "c"=>" ", "d"=>"a", "e"=>"b", "f"=>"c",
      "g"=>"d", "h"=>"e", "i"=>"f", "j"=>"g", "k"=>"h", "l"=>"i", "m"=>"j",
      "n"=>"k", "o"=>"l", "p"=>"m", "q"=>"n", "r"=>"o", "s"=>"p", "t"=>"q",
      "u"=>"r", "v"=>"s", "w"=>"t", "x"=>"u", "y"=>"v", "z"=>"w", " "=>"x"
    }
    assert_equal expected, @cipher.decrypt_shift_matches("02715", "040895")
  end

  def test_can_encrypt
    Date.stubs(:today).returns(Date.new(1995, 8, 04))
    @cipher.stubs(:gen_keys).returns("02715")

     expected = {
                   encryption: "keder ohulw",
                   key: "02715",
                   date: "040895"
                 }
     assert_equal expected,  @cipher.encrypt("hello world")
  end

  def test_machine_can_encrypt_with_unknown_character
     Date.stubs(:today).returns(Date.new(1995, 8, 04))
     @cipher.stubs(:gen_keys).returns("02715")
     expected = {
                   :encryption=>"keder ohulw!",
                   :key=>"02715",
                   :date=>"040895"
                 }

     assert_equal expected, @cipher.encrypt("hello world!")
     assert_equal expected, @cipher.encrypt("HELLO WORLD!")
     assert_equal expected, @cipher.encrypt("HeLLo WOrLD!")
  end

  def test_can_decrypt
     Date.stubs(:today).returns(Date.new(1995, 8, 04))
     @cipher.stubs(:gen_keys).returns("02715")

      expected = {
                    decryption: "hello world",
                    key: "02715",
                    date: "040895"
                  }
      assert_equal expected, @cipher.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_decrypt_with_unknown_character
     Date.stubs(:today).returns(Date.new(1995, 8, 04))
     @cipher.stubs(:gen_keys).returns("02715")

      expected = {
                    decryption: "hello world!",
                    key: "02715",
                    date: "040895"
                  }
      assert_equal expected, @cipher.decrypt("keder ohulw!", "02715", "040895")
  end
end
