require_relative "../lib/team_data"

class Player

  attr_reader :name, :position, :team

  def initialize(name, position, team)
    @name = name
    @position = position
    @team = team
  end

  def self.all_players
    everybody = []
    TeamData.to_h.map do |team_name, players|
      players.each do |player|
        everybody << player
      end
    end
    everybody
  end

end
