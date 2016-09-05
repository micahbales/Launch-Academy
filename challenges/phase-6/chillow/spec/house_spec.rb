require 'spec_helper'

describe House do
  let(:house) { House.new("4944 E Capitol St NE", "Washington", "DC", "20019", "$350,000") }

  describe "#initialize" do
    it "has an address" do
      expect(house.address).to eq("4944 E Capitol St NE")
      expect(house.city).not_to eq(nil)
    end
    it "has a city" do
      expect(house.city).to eq("Washington")
      expect(house.city).not_to eq(nil)
    end
    it "has a state" do
      expect(house.state).to eq("DC")
      expect(house.city).not_to eq(nil)
    end
    it "has a zip code" do
      expect(house.zip).to eq("20019")
      expect(house.city).not_to eq(nil)
    end
    it "has asking price" do
      expect(house.asking_price).to eq("$350,000")
      expect(house.city).not_to eq(nil)
    end
  end
end
