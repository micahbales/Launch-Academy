require 'spec_helper'

RSpec.describe Leaderboard do
  let(:leaderboard) { Leaderboard.new }
  describe ".new" do
    it "should be a leaderboard class" do
      expect(leaderboard)
      .to be_a(Leaderboard)
    end
  end

  describe "#team_data" do
    it "provides all teams as objects with several attributes" do
      expect(leaderboard.team_data.first).to be_a(Team)
    end
  end

  describe "#wins_losses" do
    it "wins and losses record for each team" do
      expect(leaderboard.wins_losses("Patriots")).to eq({wins: 3, losses: 0})
    end
  end

  describe "#rank" do
    it "provides ranking of each team" do
      expect(leaderboard.rank("Patriots")).to eq(1)
    end
  end

  describe "#print_leaderboard" do
    it "prints a leaderboard of team name, rank, wins, and losses" do
      expect(leaderboard.print_leaderboard)
      .to eq("--------------------------------------------------
| Name      Rank      Total Wins    Total Losses |
| Patriots  1         3             0            |
| Steelers  2         1             1            |
| Broncos   3         1             2            |
| Colts     4         0             2            |
--------------------------------------------------")
    end
  end
end
