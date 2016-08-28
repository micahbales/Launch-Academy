require 'spec_helper'

RSpec.describe Leaderboard do
  let(:leaderboard) { Leaderboard.new }
  describe ".new" do
    it "should be a leaderboard class" do
      expect(leaderboard)
      .to be_a(Leaderboard)
    end
  end

  describe "#teams_data" do
    it "provides all teams as objects with several attributes" do
      expect(leaderboard.teams_data.first).to be_a(Team)
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

  describe "#team_game_summary" do
    it "takes a parameter of a team object and prints the following
    details of each game that team played" do
      expect(leaderboard.team_game_summary("Patriots"))
      .to eq("Patriots played 3 games.
They played as the home team against the Broncos and won: 17 to 13.
They played as the home team against the Colts and won: 21 to 17.
They played as the away team against the Steelers and won: 31 to 24.
")
    end
  end
end
