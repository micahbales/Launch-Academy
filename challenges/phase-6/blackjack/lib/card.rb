class Card

  attr_reader :value
  attr_accessor :rank, :suit

  def initialize(card)
    @rank = card[0]
    @suit = card[1]
  end

  def value
    if facecard?
      10
    elsif ace?
      1
    else
      rank.to_i
    end
  end

  def ace?
    rank == 'A'
  end

  def facecard?
    'JQK'.include?(rank.to_s)
  end

end
