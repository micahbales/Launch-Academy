require "sinatra"
require "pry"

require "shotgun"

require_relative "round"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe",
  expire_after: 86400
}


get "/" do


  @user_wins = session[:user_wins] || 0
  @computer_wins = session[:computer_wins] || 0
  @message = session[:message]
  @winner = session[:winner]

  erb :index
end

post "/selection" do
  round = Round.new(params[:selection]).score_round

  redirect "/"
end

post "/clear" do
  session.clear
  redirect "/"
end
