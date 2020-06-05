
class Shift
  def keys(key)
    key.chars.each_cons(2).map do |key_arr|
      key_arr.join.to_i
    end
  end

  def square_date(date)
    (date.to_i)**2
  end

  def offset(date)
    last_4_chars = square_date(date).to_s.split("").last(4)
    last_4_chars.map do |character|
      character.to_i
    end
  end

  def shift_values(key, date)
    values = keys(key).zip(offset(date))
    values.map do |value|
      value.sum
    end
  end
end
