class Key
  attr_reader :input

  def initialize
    @input = randomize_numbers
  end

  def randomize_numbers
    rand(5 ** 5).to_s.rjust(5,'0')
  end

end
