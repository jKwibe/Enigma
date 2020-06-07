
require_relative "./helper"
require "./lib/cli"
require "./lib/enigma"

class CommandLineTest < Minitest::Test
  def setup
    @cli = CommandLine.new
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of CommandLine, @cli
  end

  def test_cli_can_read_file
    File.stubs(:read).returns("Hello world")
    assert_equal "Hello world", @cli.read_file
  end

  def test_cli_can_write_encryption
    @cli.stubs(:read_file).returns("Hello world")
    @cli.stubs(:delivered_path).returns("./test/encrypt.txt")
    @enigma.stubs(:key_gen).returns("02715")
    @enigma.stubs(:date_gen).returns("040895")
    assert_nil @cli.write_encryption
  end

  def test_cli_can_write_decyption
    @cli.stubs(:read_file).returns("Hello world")
    @cli.stubs(:delivered_path).returns("./test/encrypt.txt")
    @cli.stubs(:key).returns("02715")
    @cli.stubs(:date).returns("040895")
    assert_nil @cli.write_decryption
  end
end
