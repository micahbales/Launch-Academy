class CookieInventory

  attr_reader :peanut_butter, :chocolate_chip, :sugar

  def initialize
    @peanut_butter = 0
    @chocolate_chip = 0
    @sugar = 0
  end

  def cook_batch!(cookie_type, number_baked)
    if cookie_type.downcase == "peanut butter"
      @peanut_butter += number_baked
    elsif cookie_type.downcase == "chocolate chip"
      @chocolate_chip += number_baked
    elsif cookie_type.downcase == "sugar"
      @sugar += number_baked
    end
  end

  def sell!(cookie_type, number_baked)
    if cookie_type.downcase == "peanut butter"
      if number_baked > @peanut_butter
        puts "Sold Out!"
      else
        @peanut_butter -= number_baked
      end
    elsif cookie_type.downcase == "chocolate chip"
      if number_baked > @chocolate_chip
        puts "Sold Out!"
      else
        @chocolate_chip -= number_baked
      end
    elsif cookie_type.downcase == "sugar"
      if number_baked > @sugar
        puts "Sold Out!"
      else
        @sugar -= number_baked
      end
    end
  end

end
