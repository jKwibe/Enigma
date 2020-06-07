
require_relative "./helper"
require "./lib/cli"

class CommandLineTest < Minitest::Test
  def setup
    @cli = CommandLine.new
  end

  def test_it_exists
    assert_instance_of CommandLine, @cli
  end
end
