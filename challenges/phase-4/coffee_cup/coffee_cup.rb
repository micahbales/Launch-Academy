require 'pry'

class Coffee

  attr_reader :max, :amount

  def initialize(amount = 8, max = 12)
    @max = max < 2 ? 2 : max
    @amount = amount > @max ? @max : amount
  end

  def sip!
    if @amount > 0
      @amount -= 1
    else
      puts "Hey! You need a refill!"
    end
  end

  def refill!
    @amount = @max - 2
  end

  def to_s
    "There is #{@amount}oz of coffee left in your #{@max}oz cup."
  end

end

binding.pry
