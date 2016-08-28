require 'spec_helper'

RSpec.describe Game do
  let(:game) {Game.new("Patriots", "Broncos", 17, 13)}
  describe ".new" do
    it 'has 4 attributes: home_team, away_team, home_score, away_score' do
      expect(game.home_team).to eq("Patriots")
      expect(game.away_team).to eq("Broncos")
      expect(game.home_score).to eq(17)
      expect(game.away_score).to eq(13)
    end
  end
  describe "#home_team_won?" do
    it "indicates whether the home_team won the match" do
      expect(game.home_team_won?).to eq(true)
    end
  end
end
