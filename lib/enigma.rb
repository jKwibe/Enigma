
class Enigma
  def date_gen
    Date.today.strftime("%d%m%y")
  end

  def gen_keys
    random_num_arr =  5.times.map{ rand(10) }
    random_num_arr.join
  end
end
