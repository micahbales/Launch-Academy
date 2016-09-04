class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
  attr_reader :secret_identity
end

class Speedster < SuperHero
  def speed_in_mph
    super * 1000
  end
  def powers
    "Afterburner"
  end

  def weakness
    "Burnout from wind friction/drag"
  end

  def backstory
    "His father was a space shuttle, his mother was an SR-71 Blackbird"
  end
end

class Brawler < SuperHero
  def health
    super * 20
  end
  def powers
    "Bone-crushing Punch"
  end

  def weakness
    "Vulnerable to brass knuckles"
  end

  def backstory
    "Grew up on the wrong side of the tracks in Chicago"
  end
end

class Detective < SuperHero
  def weakness
    secret_identity
  end
  def secret_identity
    "Luke Bayne"
  end
  def speed_in_mph
    super / 6
  end
  def powers
    "Powers of Deduction"
  end

  def backstory
    "Grew up in the Belt, lives on Ceres"
  end
end

class Demigod < SuperHero
  def home
    "Cosmic Plane"
  end
  def powers
    "Hammer of Thor"
  end

  def weakness
    "Loves the ladies"
  end

  def backstory
    "Son of Thor and a human woman"
  end
end

class JackOfAllTrades < SuperHero
  def species
    "Alien"
  end
  def home
    "Venus"
  end
  def psychic?
    true
  end
  def powers
    "Pretty good at almost everything"
  end

  def weakness
    "Not truly 'super' at any one thing"
  end

  def backstory
    "She is a SEVEN on the Enneagram and just can't commit to a single power"
  end
end

class WaterBased < SuperHero
  def fans_per_thousand
    super / 100
  end
  def home
    "Earth's Oceans"
  end
  def psychic?
    true
  end
  def powers
    "Breathes Under Water"
  end

  def weakness
    "Unsightly webbed toes"
  end

  def backstory
    "His mother was a shark, father was a merman"
  end
end
