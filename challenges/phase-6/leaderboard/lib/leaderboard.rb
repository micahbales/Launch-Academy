class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

require 'pry'

  attr_reader :team_data

  def initialize
    @team_data = get_team_data
  end

  def get_team_data
    @team_team_records = []
    GAME_INFO.each do |game|
      if !@team_team_records.find{ |a| a.name == game[:home_team]}
        @team_team_records << Team.new(game[:home_team])
      end
      if !@team_team_records.find{ |a| a.name == game[:away_team]}
        @team_team_records << Team.new(game[:away_team])
      end
    end
    GAME_INFO.each do |game|
      home_team = @team_team_records.find { |team| team.name == game[:home_team]}
      away_team = @team_team_records.find { |team| team.name == game[:away_team]}
      if game[:home_score] > game[:away_score]
        home_team.wins += 1
        away_team.losses += 1
      else
        home_team.losses += 1
        away_team.wins += 1
      end
    end
    @team_team_records.sort! {|a, b| b.wins-b.losses <=> a.wins-a.losses}
    @team_team_records.each_with_index do |team, i|
      team.rank = i + 1
    end
    @team_team_records
  end

  def wins_losses(team_name)
    @team_data.each do |team|
      if team.name == team_name
        @wins_losses = {wins: team.wins, losses: team.losses}
      end
    end
    @wins_losses
  end

  def rank(team_name)
    @team_data.each do |team|
      if team.name == team_name
        @rank = team.rank
      end
    end
    @rank
  end

  def print_leaderboard
    @print_leaderboard = "--------------------------------------------------
| Name      Rank      Total Wins    Total Losses |
| #{@team_data[0].name}  #{@team_data[0].rank}         #{@team_data[0].wins}             #{@team_data[0].losses}            |
| #{@team_data[1].name}  #{@team_data[1].rank}         #{@team_data[1].wins}             #{@team_data[1].losses}            |
| #{@team_data[2].name}   #{@team_data[2].rank}         #{@team_data[2].wins}             #{@team_data[2].losses}            |
| #{@team_data[3].name}     #{@team_data[3].rank}         #{@team_data[3].wins}             #{@team_data[3].losses}            |
--------------------------------------------------"
  end

end
