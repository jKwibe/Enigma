require_relative  "./cipher"
class Enigma
  def initialize
    @cipher= Cipher.new
  end
  
  def date_gen
    Date.today.strftime("%d%m%y")
  end

  def gen_keys
    random_num_arr =  5.times.map{ rand(10) }
    random_num_arr.join
  end

  def encrypt(message, key = gen_keys, date = date_gen)
    @cipher.encrypt(message, key, date)
  end

  def decrypt(message, key = gen_keys, date = date_gen)
    @cipher.decrypt(message, key, date)
  end
end
