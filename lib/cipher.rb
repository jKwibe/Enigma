require_relative "./shift"
require_relative "./modules/displayable"
require_relative "./modules/generatable"

class Cipher < Shift
  include Displayable
  include Generatable
  def characters
    ("a".."z").to_a << " "
  end

  def encrypt_shift_matches(key, date, count = 0)
    group_matches = characters.zip(characters.rotate(shift_values(key, date)[count]))
    Hash[group_matches]
  end

  def decrypt_shift_matches(key, date, count = 0)
    group_matches = characters.zip(characters.rotate(-shift_values(key, date)[count]))
    Hash[group_matches]
  end

  def encrypt(message, key = gen_keys, date = date_gen)
    encrypted_text = ""
    count = 0
    message.downcase.chars do |char|
      if characters.include?(char)
        encrypted_text << encrypt_shift_matches(key, date, count)[char]
      else
        encrypted_text << char
      end
      count.eql?(3) ? count = 0 : count+= 1
    end
    encrypted_message(encrypted_text, key, date)
  end

  def decrypt(message, key = gen_keys, date = date_gen)
    encrypted_text = ""
    count = 0
    message.downcase.chars do |char|
      if characters.include?(char)
        encrypted_text << decrypt_shift_matches(key, date, count)[char]
      else
        encrypted_text << char
      end
      count.eql?(3) ? count = 0 : count+= 1
    end
    decrypted_message(encrypted_text, key, date)
  end
end
