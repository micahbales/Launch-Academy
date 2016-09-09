require_relative "../lib/team_data"

class Team

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.players
    all_players = []
    TeamData.to_h.each do |team_name, players|
      players.each do |player|
        all_players << Player.new(player[1], player[0], team_name)
      end
    end
    all_players
  end

  def self.positions
    positions = []
    TeamData.to_h.each do |team_name, players|
      players.each do |player|
        position = player[0]
        positions << position
      end
      break
    end
    positions
  end

  def self.find(team_name)
    Team.new(team_name)
  end

  def self.all_teams
    TeamData.to_h.map do |team_name, players|
      Team.new(team_name)
    end
  end

end
