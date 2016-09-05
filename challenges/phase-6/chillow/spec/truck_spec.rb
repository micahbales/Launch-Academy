require 'spec_helper'

describe Truck do
  let(:truck) { Truck.new(25) }
  let(:box) { Box.new(Occupant.new("Billy", "Jean")) }
  let(:box2) { Box.new(Occupant.new("Bobby", "Fisher")) }

  describe "#initialize" do
    it "has 'total' attribute, initialized as an empty array" do
      expect(truck.total).to eq []
    end

    it "has 'capacity' attribute" do
      expect(truck.capacity).to eq 25
    end
  end

  describe "#add" do
    it "adds the box to truck's 'total' attribute" do
      truck.add(box)
      expect(truck.total[0].owner.first_name).to eq "Billy"
      expect(truck.total[0].owner.last_name).to eq "Jean"
    end
    it "checks to see if the truck is full, if so, inform the user that there is no more space" do
      25.times do
        truck.add(box)
      end
      expect(truck.add(box)).to eq "Sorry, there's no room!"
    end
  end

  describe "#remove" do
    it "removes the last box in from the truck" do
      25.times do
        truck.add(box)
      end
      truck.remove
      expect(truck.total.length).to eq 24
      expect(truck.remove).to eq (box)
    end
  end

  describe "#full?" do
    it "returns true if the truck has reached its capacity" do
      25.times do
        truck.add(box)
      end
      expect(truck.full?).to eq true
    end
    it "returns false if the truck has not reached its capacity" do
      expect(truck.full?).to eq false
    end
  end

  describe "#remove_all" do
    it "removes all total from one Occupant, leaving the rest" do
      15.times do
        truck.add(box)
      end
      10.times do
        truck.add(box2)
      end
      truck.remove_all("Billy", "Jean")
      expect(truck.total.length).to eq 10
    end
  end

end
