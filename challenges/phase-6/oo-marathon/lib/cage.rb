class Cage

  attr_accessor :animal

  def empty?
    if !@animal
      true
    else
      false
    end
  end

end
