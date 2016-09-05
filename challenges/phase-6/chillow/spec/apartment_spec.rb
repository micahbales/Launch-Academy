require 'spec_helper'

describe Apartment do
  let(:apartment) { Apartment.new("4944 E Capitol St NE", "Washington", "DC", "20019", "$2000", "10/01/2016", "10/01/2017") }
  let(:elvis) { Occupant.new("Elvis", "Presley") }
  let(:bobby) { Occupant.new("Bobby", "Lee") }
  let(:lee) { Occupant.new("Lee Harvey", "Oswald") }

  it "has a list of occupants" do
    expect(apartment.total).to eq []
  end

  describe "#add" do
    it "lists an occupant when one is added" do
      apartment.add(bobby)
      expect(apartment.total[0].first_name).to eq "Bobby"
      expect(apartment.total[0].last_name).to eq "Lee"
    end

    it "if there are 3 or more roomates, the apartment is full" do
      apartment.add(bobby)
      apartment.add(lee)
      apartment.add(elvis)
      expect(apartment.add(Occupant.new("Marilyn", "Monroe"))).to eq "Sorry, there's no room!"
    end
  end

  describe "#remove" do
    it "removes the last roomate from the list" do
      apartment.add(bobby)
      apartment.add(lee)
      apartment.add(elvis)
      expect(apartment.remove).to eq "Elvis has left the building"
    end
  end

  describe "#full?" do
    it "returns false if there are two occupants" do
      apartment.add(bobby)
      apartment.add(lee)
      expect(apartment.full?).to eq false
    end

    it "returns true if there are three occupants" do
      apartment.add(bobby)
      apartment.add(lee)
      apartment.add(elvis)
      expect(apartment.full?).to eq true
    end
  end

end
