require 'spec_helper'

describe Box do
  let(:box) { Box.new(Occupant.new("Billy", "Jean")) }

  describe "#initialize" do
    it "has an 'owner' attribute, which is the Occupant who owns the box" do
      expect(box.owner.first_name).to eq "Billy"
      expect(box.owner.last_name).to eq "Jean"
    end
  end
end
