class Ingredient

  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def self.create_from_grams(name, weight)
    Ingredient.new(name, weight/1000)
  end

end
