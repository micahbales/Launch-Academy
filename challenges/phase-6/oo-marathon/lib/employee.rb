class Employee

  attr_reader :name, :title, :full_title

  def initialize(name, title = "Zoo Keeper")
    @name = name
    @title = title
    @full_title = "#{name}, #{title}"
  end

  def greet
    "#{name} waved hello!"
  end

end
