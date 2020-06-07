require_relative "./enigma"

class CommandLine
  def initialize
    @enigma = Enigma.new
    @message_path = ARGV[0]
    @delivered_path = ARGV[1]
    @key = ARGV[2]
    @date = ARGV[3]
  end
end
