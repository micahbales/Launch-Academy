require "spec_helper"

RSpec.describe Player do
  let(:player) { Player.new }
  let(:homer) { Player.new("Homer Simpson", "Pitcher", "Simpson Slammers") }

  describe "#initialize" do
    it "has a name" do
      expect(homer.name).to eq("Homer Simpson")
    end

    it "has a team" do
      expect(homer.team).to eq("Simpson Slammers")
    end

    it "has a position" do
      expect(homer.position).to eq("Pitcher")
    end
  end

  # describe "#self.all" do
  #   it "returns an array of all players" do
  #     expect(Player.all).to be_a(Array)
  #   end
  #
  #   it "returns an array in which each player's name, team, and position exists in a hash" do
  #     players = Player.all
  #     expect(player[0]).to be_a(Hash)
  #   end
  # end

end
