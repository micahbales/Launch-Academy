require 'spec_helper'

describe Dwelling do
  let(:dwelling) { Dwelling.new("4944 E Capitol St NE", "Washington", "DC", "20019") }

  describe "#initialize" do
    it "has an address" do
      expect(dwelling.address).to eq("4944 E Capitol St NE")
    end

    it "has a city" do
      expect(dwelling.city).to eq("Washington")
    end

    it "has a state" do
      expect(dwelling.state).to eq("DC")
    end

    it "has a zip code" do
      expect(dwelling.zip).to eq("20019")
    end
  end
end
