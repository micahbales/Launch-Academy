require "spec_helper"

describe Hand do

  let(:number_cards) { Hand.new(["8♠", "2♦"])}
  let(:ten_face_hand) { Hand.new(["10♦", "J♥"]) }
  let(:ace_face_hand) { Hand.new(["A♠", "K♥"]) }
  let(:two_face) { Hand.new(["K♥", "Q♣"]) }
  let(:ace_two_face) { Hand.new(["K♥", "10♣", "A♠"]) }
  let(:two_aces) { Hand.new(["A♠", "A♥"]) }
  let(:big_hand) { Hand.new(["K♥", "2♦", "A♠", "A♥", "A♣"]) }

  describe "#calculate_hand" do

    it "returns a number for two number cards" do
      expect(number_cards.calculate_hand).to eq(10)
    end

    it "returns 20 for a 10 and a face card" do
      expect(ten_face_hand.calculate_hand).to eq(20)
    end

    it "returns 21 for an ace and a face card" do
      expect(ace_face_hand.calculate_hand).to eq(21)
    end

    it "returns 20 for two face cards" do
      expect(two_face.calculate_hand). to eq(20)
    end

    it "returns 21 for an ace and two face cards" do
      expect(ace_two_face.calculate_hand).to eq(21)
    end

    it "returns 12 for two aces" do
      expect(two_aces.calculate_hand). to eq(12)
    end

    it "returns three aces at value 1, to reduce overall value
    in hand including numbers and face cards" do
      expect(big_hand.calculate_hand).to eq(15)
    end

  end
end
