class Airplane
  attr_reader :type, :wing_loading, :horsepower
  attr_accessor :start, :fuel

  def initialize(type, wing_loading, horsepower, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @fuel = fuel
    @start = false
    @takeoff = false
  end

  def start
    if @fuel <= 0
      raise 'Cannot start plane, no fuel'
      require 'pry'
      binding.pry
    elsif @start == false
      @fuel -= 5
      @start = true
    else
      raise 'The plane is already on'
    end
  end

  def takeoff
    if @fuel < 40
      raise 'Cannot take off, fuel is too low'
    elsif @start == true
      @fuel -= 30
      @takeoff = true
      "We have liftoff!"
    else
      "Start the engine first"
    end
  end

  def land
    if @start == false
      "Airplane has not started, please start"
    elsif @start == true && @takeoff == false
      "Airplane is already on the ground"
    elsif @fuel < 10
      raise 'Good thing you landed when you did - fuel was running out!'
    else@start == true && @takeoff == true
      "Houston, the Eagle has landed"
    end
  end
end
