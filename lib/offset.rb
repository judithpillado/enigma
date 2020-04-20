require 'date'

class Offset
  attr_reader :date

  def initialize
    @date = Time.now.strftime("%m%d%y")
  end

  def squared_date
    squared = @date.to_i * @date.to_i
    strings = squared.to_s.chars[-4..-1]
    offsets = strings.map { |string| string.to_i }
    offsets
  end

end
