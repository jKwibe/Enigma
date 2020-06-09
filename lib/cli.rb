require_relative "./enigma"
require_relative "./modules/generatable"

class CommandLine
  include Generatable
  attr_reader :enigma,
              :message_path,
              :delivered_path,
              :key,
              :date
  def initialize
    @enigma = Enigma.new
    @message_path = ARGV[0]
    @delivered_path = ARGV[1]
    @key = ARGV[2]
    @date = ARGV[3]
  end

  def read_file
    File.read(@message_path).chomp
  end

  def write_encryption
    message = @enigma.encrypt(read_file)
    File.write(delivered_path, message[:encryption])
    puts "Created #{delivered_path} with key of #{message[:key]} and date #{message[:date]}"
  end

  def write_decryption
    encrypted_message = @enigma.decrypt(read_file, key, date)
    File.write(delivered_path, encrypted_message[:decryption])
    puts "Created #{delivered_path} with key of #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
  end
end
