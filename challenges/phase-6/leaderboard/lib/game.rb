class Game

  attr_accessor :home_team, :away_team, :home_score, :away_score

  def initialize(home_team, away_team, home_score, away_score)
    @home_team = home_team
    @away_team = away_team
    @home_score = home_score
    @away_score = away_score
  end

  def home_team_won?
    @home_score > @away_score
  end
  
end
