require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    total = 0
    @cards.each do |card|
    if card.include?("K") || card.include?("Q") || card.include?("J") || card.include?("10")
      total += 10
    end
    if card.to_i <= 9 && card.to_i >= 2
      total += card[0].to_i
    end
    if card.include?("A") && total < 11
      total += 11
    elsif card.include?("A") && total >= 11
      total += 1
    end
    end
    total
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
