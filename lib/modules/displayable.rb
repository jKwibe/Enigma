

module Displayable
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
end
