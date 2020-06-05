
class Shift
  def keys(key)
    key.chars.each_cons(2).map do |key_arr|
      key_arr.join.to_i
    end
  end

  def square_date(date)
    (date.to_i)**2
  end
end
