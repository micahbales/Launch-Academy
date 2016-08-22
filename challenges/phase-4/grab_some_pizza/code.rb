class Pizza

  attr_reader :cheese, :pepperoni, :bacon, :sausage, :mushroom, :onion, :jalapeno, :green_pepper

  Toppings = {
      cheese: 0.10,
      green_pepper: 0.30,
      onion: 0.50,
      mushroom: 0.70,
      jalapeno: 1.30,
      pepperoni: 1.10,
      sausage: 1.70,
      bacon: 1.90
  }

  def initialize(ingredients = [:cheese])
    @ingredients = ingredients
  end

  def cost
    @price = 8.0
    @ingredients.each do |ingredient|
      @price += Toppings[ingredient]
    end
    "$#{@price}"
  end

  def meats
    @ingredients & [:sausage, :pepperoni, :bacon]
  end

  def other_toppings
    @ingredients & [:cheese, :green_pepper, :onion, :mushroom, :jalepeno]
  end

  def self.toppings
    our_toppings = []
    our_toppings.push("Our toppings are: \n")
    Toppings[:other_toppings].each do |key, value|
      our_toppings.push("* #{key} ($#{value}0)\n")
    end
    Toppings[:meats].each do |key, value|
      our_toppings.push("* #{key} ($#{value}0)\n")
    end
    puts our_toppings.join('')
  end

end

require 'pry'
binding.pry
