require_relative "./shift"

class Cipher < Shift
  def characters
    ("a".."z").to_a << " "
  end
end
