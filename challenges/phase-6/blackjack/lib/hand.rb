class Hand

  attr_accessor :cards, :total_score

  def initialize(cards)
    @cards = Array(cards)
  end

  def calculate_hand
    total_score = 0
    @cards.each do |card|
    if card.rank.include?("K") || card.rank.include?("Q") || card.rank.include?("J") || card.rank.include?("10")
      total_score += 10
    end
    if card.rank.to_i <= 9 && card.rank.to_i >= 2
      total_score += card.rank.to_i
    end
    if card.rank.include?("A") && total_score < 11
      total_score += 11
    elsif card.rank.include?("A") && total_score >= 11
      total_score += 1
    end
    end
    total_score
  end

end
