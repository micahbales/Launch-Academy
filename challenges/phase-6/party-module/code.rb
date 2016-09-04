module PartyGoer
  def initialize
    @drinks = 0
  end

  def sing
    "Hi-ho, the derry-o! Hi-ho, the derry-o! Whiskey in the jar-o!"
  end

  def drink
    if @drinks >= 3
      false
    else
      @drinks += 1
      true
    end
  end

  def cause_havoc
    raise PersonalizedHavocError
  end

end
