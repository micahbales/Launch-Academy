class Card

  attr_accessor :rank, :suit

  def initialize(card)
    @rank = card[0]
    @suit = card[1]
  end

  def type
    if @rank == "A"
      type = "ace"
    elsif @rank == "K" || @rank == "Q" || @rank == "J"
      type = "face card"
    else
      type = "number card"
    end
    type
  end

end
