require "spec_helper"

RSpec.describe TeamData do
  describe ".to_h" do
    it "returns a hash" do
      teams = TeamData.to_h
      expect(teams).to be_a(Hash)
    end

    it "contains data from the 'roster.json' file" do
      teams = TeamData.to_h
      expect(teams.keys).to include("Simpson Slammers")
    end
  end
end
