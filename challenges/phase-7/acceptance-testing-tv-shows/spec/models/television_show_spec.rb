require "spec_helper"

describe TelevisionShow do

  describe "#self.repeat?" do

    it "returns false when there is no repeat entry" do
      expect(TelevisionShow.repeat?("Billy Bob Show")).to eq false
    end

    it "returns true when there is a repeat title entry" do
      CSV.open("television-shows.csv", "a") do |row|
      row << ["Billy Bob Show", "", "", "", "Action"]
      end
      expect(TelevisionShow.repeat?("Billy Bob Show")).to eq true
    end
  end
end
