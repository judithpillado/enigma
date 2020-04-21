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

  def encrypt(message, key, date = Time.now.strftime("%d%m%y"))
    keys = Key.new(key)
    offsets = Offset.new(date)
    shift = shifts(keys, offsets)
    letters = message.downcase.chars
    encoded_message = []
    letters.each_with_index do |letter, index|
      initial_index = @alphabet.index(letter)
      if index % 4 == 0
        shifted_alphabet = @alphabet.rotate(shift[:A])
        encoded_message << shifted_alphabet[initial_index]
      elsif index % 4 == 1
        shifted_alphabet = @alphabet.rotate(shift[:B])
        encoded_message << shifted_alphabet[initial_index]
      elsif index % 4 == 2
        shifted_alphabet = @alphabet.rotate(shift[:C])
        encoded_message << shifted_alphabet[initial_index]
      elsif index % 4 == 3
        shifted_alphabet = @alphabet.rotate(shift[:D])
        encoded_message << shifted_alphabet[initial_index]
      end
    end
    xcryption(:encryption, encoded_message.join, key, date)
  end

end
