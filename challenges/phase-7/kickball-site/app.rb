require "sinatra"
require_relative "models/player"
require_relative "models/team"

get "/" do
  '''
  <h1>The LACKP Homepage<h1>
  <h3>Navigation:</h3>
  <ul>
    <li><a href="/teams">Teams</a></li>
    <li><a href="/players">Players</a></li>
    <li><a href="/positions">Positions</a></li>
  </ul>
  '''
end

get "/positions" do

  @positions = Team.positions
  erb :positions

end

get "/positions/:position" do

  @players = Team.players
  @position = params[:position]
  erb :position

end

get "/players" do

  @players = Team.players
  erb :players

end

get "/teams" do

  @all_teams = Team.all_teams
  erb :teams

end

get "/teams/:team_name" do

  @players = Team.players
  @name = params[:team_name]
  erb :team

end
