require 'zooatcapacity'

class Zoo

  attr_reader :name, :season_opening_date, :season_closing_date, :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    10.times do
      @cages << Cage.new()
    end
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    if date >= season_opening_date && date <= season_closing_date
      true
    else
      false
    end
  end

  def add_animal(animal)
    @cages.each_with_index do |cage, index|
      if cage.empty?
        @cages[index].animal = animal
        return
      end
    end
    raise ZooAtCapacity, "There's no more room in the zoo. Buy more cages!"
  end

  def visit
    greetings = ""
    @employees.each do |employee|
      greetings += employee.greet + "\n"
    end
    @cages.each do |cage|
      if !cage.animal.nil?
        greetings += cage.animal.speak + "\n"
      end
    end
    greetings
  end

end
