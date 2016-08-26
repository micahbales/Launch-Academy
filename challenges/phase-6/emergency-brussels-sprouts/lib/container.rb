class Container

  attr_reader :weight, :maximum_holding_weight
  attr_accessor :ingredients

  def initialize(weight, maximum_holding_weight)
    @weight = weight
    @maximum_holding_weight = maximum_holding_weight
    @ingredients = []
  end

  def which_ingredient
    "Brussels Sprouts"
  end

  def fill_with_ingredient(ingredient)
    if ingredient.name == "Brussels Sprouts"
      7000.times do
        @ingredients << ingredient
      end
    elsif ingredient.name == "Cheesy Poof"
      40_000.times do
        @ingredients << ingredient
      end
    end
    @weight += @maximum_holding_weight
  end

  def how_many_ingredients
    @ingredients.size
  end

  def remove_one_ingredient
    @ingredients.pop()
  end

  def empty
    @ingredients = []
  end

end
