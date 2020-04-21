class Enigma

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def shifts(key, offset)
    hash = Hash.new
    hash[:A] = key.assign_keys[:A] + offset.assign_offsets[:A]
    hash[:B] = key.assign_keys[:B] + offset.assign_offsets[:B]
    hash[:C] = key.assign_keys[:C] + offset.assign_offsets[:C]
    hash[:D] = key.assign_keys[:D] + offset.assign_offsets[:D]
    hash
  end

  def xcryption(xcryption, message, key, date)
    hash = Hash.new
    hash[xcryption] = message
    hash[:key] = key
    hash[:date] = date
    hash
  end

end
