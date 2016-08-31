class Hand
  attr_accessor :cards, :total_score

  def initialize(cards)
    @cards = Array(cards)
  end

  def calculate_hand
    total_value = 0
    @cards.each do |card|
      total_value += card.value
    end
    account_for_aces(total_value)
  end

  def account_for_aces(total_value)
    @cards.each do |card|
      if card.ace? && total_value <= 11
        total_value +=10
      end
    end
    total_value
  end
end
