require 'spec_helper'

describe Occupant do
  let (:occupant) {Occupant.new("Jimmy", "Bob")}

  describe "#initialize" do
    it "has first name" do
      expect(occupant.first_name).to eq("Jimmy")
    end
    it "has last name" do
      expect(occupant.last_name).to eq("Bob")
    end
  end

end
