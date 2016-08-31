require "spec_helper"

RSpec.describe Card do
  let(:four_diamonds) { Card.new("4♦") }
  let(:king_hearts) { Card.new("K♥")}
  let(:ace_spades) {Card.new("A♠")}
  it "has 'suit' and 'rank' attributes" do
    expect(four_diamonds.rank).to eq("4")
    expect(four_diamonds.suit).to eq("♦")
    expect(king_hearts.rank).to eq("K")
    expect(king_hearts.suit).to eq("♥")
    expect(ace_spades.rank).to eq("A")
    expect(ace_spades.suit).to eq("♠")
  end

  describe "#type" do
    it "says that the card is a number card" do
      expect(four_diamonds.type).to eq("number card")
    end
    it "says that the card is a face card" do
      expect(king_hearts.type).to eq("face card")
    end
    it "says the card is an ace" do
      expect(ace_spades.type).to eq("ace")
    end
  end

end


# SUITS = ['♦', '♣', '♠', '♥']
# RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
