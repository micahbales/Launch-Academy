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

  attr_reader :teams_data, :games_data

  def initialize
    @teams_data = get_teams_data
    @games_data = get_games_data
  end

  def get_teams_data
    @all_team_records = []
    GAME_INFO.each do |game|
      if !@all_team_records.find{ |a| a.name == game[:home_team]}
        @all_team_records << Team.new(game[:home_team])
      end
      if !@all_team_records.find{ |a| a.name == game[:away_team]}
        @all_team_records << Team.new(game[:away_team])
      end
    end
    GAME_INFO.each do |game|
      home_team = @all_team_records.find { |team| team.name == game[:home_team]}
      away_team = @all_team_records.find { |team| team.name == game[:away_team]}
      if game[:home_score] > game[:away_score]
        home_team.wins += 1
        away_team.losses += 1
      else
        home_team.losses += 1
        away_team.wins += 1
      end
    end
    @all_team_records.sort! {|a, b| b.wins-b.losses <=> a.wins-a.losses}
    @all_team_records.each_with_index do |team, i|
      team.rank = i + 1
    end
    @all_team_records
  end

  def get_games_data
    @all_games = []
    GAME_INFO.each do |game|
      @all_games << Game.new(game[:home_team], game[:away_team], game[:home_score], game[:away_score])
    end
  end

  def wins_losses(team_name)
    @teams_data.each do |team|
      if team.name == team_name
        @wins_losses = {wins: team.wins, losses: team.losses}
      end
    end
    @wins_losses
  end

  def rank(team_name)
    @teams_data.each do |team|
      if team.name == team_name
        @rank = team.rank
      end
    end
    @rank
  end

  def print_leaderboard
    @print_leaderboard = "--------------------------------------------------
| Name      Rank      Total Wins    Total Losses |
| #{@teams_data[0].name}  #{@teams_data[0].rank}         #{@teams_data[0].wins}             #{@teams_data[0].losses}            |
| #{@teams_data[1].name}  #{@teams_data[1].rank}         #{@teams_data[1].wins}             #{@teams_data[1].losses}            |
| #{@teams_data[2].name}   #{@teams_data[2].rank}         #{@teams_data[2].wins}             #{@teams_data[2].losses}            |
| #{@teams_data[3].name}     #{@teams_data[3].rank}         #{@teams_data[3].wins}             #{@teams_data[3].losses}            |
--------------------------------------------------"
  end

  def team_game_summary(team_name)

    number_of_games = 0
    game_descriptions = ""

    @games_data.each do |game|

      if game[:home_team] == team_name || game[:away_team] == team_name
        number_of_games += 1
        played_as = ""
        opposing_team = ""
        won_lost = ""
        winning_score = 0
        losing_score = 0

        if game[:away_team] == team_name

          played_as = "the away team"
          opposing_team = game[:home_team]

          if game[:home_score] < game[:away_score]
            won_lost = "won"
            winning_score = game[:away_score]
            losing_score = game[:home_score]
          else
            won_lost = "lost"
            losing_score = game[:away_score]
            winning_score = game[:home_score]
          end
        elsif game[:home_team] == team_name
          played_as = "the home team"
          opposing_team = game[:away_team]

          if game[:home_score] > game[:away_score]
            won_lost = "won"
            losing_score = game[:away_score]
            winning_score = game[:home_score]
          else
            won_lost = "lost"
            winning_score = game[:away_score]
            losing_score = game[:home_score]
          end
        end
        game_descriptions += "They played as #{played_as} against the #{opposing_team} and #{won_lost}: #{winning_score} to #{losing_score}.\n"
      end
    end
  intro = "#{team_name} played #{number_of_games} games.\n"
  summary_description = intro + game_descriptions
  end

end
