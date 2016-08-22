SAFE_FOODS = [
  "Brussels sprouts",
  "spinach",
  "eggs",
  "milk",
  "tofu",
  "seitan",
  "bell peppers",
  "quinoa",
  "kale",
  "chocolate",
  "beer",
  "wine",
  "whiskey"
]


class Ingredient

  attr_reader :quantity, :unit, :name, :summary

  def initialize(quantity, unit, name)
    @quantity = quantity.to_f
    @unit = unit
    @name = name
  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end

  def safe?
    SAFE_FOODS.include?(@name)
  end

  def self.parse(string)
    description = string.split(' ')
    @quantity = description[0].to_i
    @unit = description[1]
    @name = description[2]
    Ingredient.new(@quantity, @unit, @name)
  end

end

class Recipe

  attr_reader :name, :ingredients, :instructions, :summary

  def initialize(name, ingredients, instructions)
    @name = name
    @ingredients = ingredients
    @instructions = instructions
  end

  def summary
    puts "Name: #{@name}\n\n"

    @ingredients.each do |ingredient|
      puts "- #{ingredient.summary}"
    end
    puts

    @instructions.each_with_index do |instruction, index|
      puts "#{index + 1}. #{instruction}"
    end
    puts
  end

  def safe?
    @ingredients.each do |ingredient|
      if !ingredient.safe?
        return false
      end
    end
    true
  end

end

# testing: 

safe_name = "Chocolate Quinoa"
safe_ingredients = [
        Ingredient.new(1.0, "cup", "quinoa"),
        Ingredient.new(1.0, "cup", "chocolate")
      ]
safe_instructions = [
        "Melt chocolate.",
        "Pour over quinoa.",
        "Regret your life."
      ]
safe_recipe = Recipe.new(safe_name, safe_ingredients, safe_instructions)
puts "Is #{safe_recipe.name} safe? #{safe_recipe.safe?}"

deadly_name = "Death by Chocolate"
deadly_ingredients = [
        Ingredient.new(1.0, "cup", "french fries"),
        Ingredient.new(1.0, "cup", "chocolate")
      ]
deadly_instructions = [
        "Melt chocolate.",
        "Pour over french fries.",
        "Regret your life."
      ]
deadly_recipe = Recipe.new(deadly_name, deadly_ingredients, deadly_instructions)
puts "Is #{deadly_recipe.name} safe? #{deadly_recipe.safe?}"

parsed_name = "Chocolate Tofu"
parsed_ingredients = [
        Ingredient.parse("1 slab tofu"),
        Ingredient.parse("2 gallons chocolate")
      ]
parsed_instructions = [
        "Melt chocolate.",
        "Pour over french fries.",
        "Regret your life."
      ]
parsed_recipe = Recipe.new(parsed_name, parsed_ingredients, parsed_instructions)
puts "Is #{parsed_recipe.name} safe? #{parsed_recipe.safe?}"
