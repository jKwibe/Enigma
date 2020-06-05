require_relative "./shift"

class Cipher < Shift
  def characters
    ("a".."z").to_a << " "
  end

  def encrypted_message(message, key, date)
    {
      encryption: message ,
      key: key,
      date: date
    }
  end

  def decrypted_message(message, key, date)
    {
      decryption: message ,
      key: key,
      date: date
    }
  end

  def encrypt_shift_matches(key, date, count = 0)
    group_matches = characters.zip(characters.rotate(shift_values(key, date)[count]))
    Hash[group_matches]
  end

  def decrypt_shift_matches(key, date, count = 0)
    group_matches = characters.zip(characters.rotate(-shift_values(key, date)[count]))
    Hash[group_matches]
  end

  def encrypt(message, key, date)
    encrypted_text = ""
    count = 0
    message.chars do |char|
      encrypted_text << encrypt_shift_matches(key, date, count)[char]
      count.eql?(3) ? count = 0 : count+= 1
    end
    encrypted_message(encrypted_text, key, date)
  end

  def decrypt(message, key, date)
    encrypted_text = ""
    count = 0
    message.chars do |char|
      encrypted_text << decrypt_shift_matches(key, date, count)[char]
      count.eql?(3) ? count = 0 : count+= 1
    end
    decrypted_message(encrypted_text, key, date)
  end
end
