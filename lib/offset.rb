require 'time'

class Offset
  attr_reader :date

  def initialize
    @date = Time.now.strftime("%d%m%y")
  end

  def squared_date
    squared = @date.to_i * @date.to_i
    strings = squared.to_s.chars[-4..-1]
    offsets = strings.map { |string| string.to_i }
    offsets
  end

  def assign_offsets
    hash = Hash.new
    hash[:A] = squared_date[0]
    hash[:B] = squared_date[1]
    hash[:C] = squared_date[2]
    hash[:D] = squared_date[3]
    hash
  end

end
