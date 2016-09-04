require 'spec_helper'

class Launcher
  include PartyGoer

  def self.invited?
    true
  end

end

describe "The Party" do
  let!(:partygoer) { Launcher.new }

  describe "#drink" do
    it "returns true" do
      expect(partygoer.drink).to eq(true)
    end

    describe "When having more than three drinks" do
      it "returns false" do
        expect(partygoer.drink).to eq(true)
        expect(partygoer.drink).to eq(true)
        expect(partygoer.drink).to eq(true)
        expect(partygoer.drink).to eq(false)
      end
    end
  end

  describe "#sing" do
    it "returns a string" do
      expect(partygoer.sing).to be_a String
    end
  end

  describe "#cause_havoc" do
    it "raises an error if undefined" do
      expect { partygoer.cause_havoc }.to raise_error(PersonalizedHavocError, "You should define this yourself!")
    end
  end

  describe ".invited?" do
    it "returns true!" do
      expect(Launcher.invited?).to eq(true)
    end
  end
end
