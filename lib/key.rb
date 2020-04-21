class Key
  attr_reader :input

  def initialize(input = randomize_numbers)
    @input = input 
  end

  def randomize_numbers
    rand(5 ** 5).to_s.rjust(5,'0')
  end

  def generate_keys
    keys = []
      @input.chars.each_cons(2).each do |first, second|
        string = first + second
        keys << string.to_i
    end
    keys
  end

  def assign_keys
    hash = Hash.new
    hash[:A] = generate_keys[0]
    hash[:B] = generate_keys[1]
    hash[:C] = generate_keys[2]
    hash[:D] = generate_keys[3]
    hash
  end

end
