require "sinatra"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe",
  expire_after: 86400
}

def detect_round_winner(user_selection)

  computer_selection = %w(rock paper scissors).sample

  session[:player_choice] = user_selection
  session[:computer_choice] = computer_selection

  if user_selection == computer_selection
    "Tie!"
  elsif user_selection == "paper" && computer_selection == "rock"
    session[:user_wins] += 1
    "Player wins!"
  elsif user_selection == "paper" && computer_selection == "scissors"
    session[:computer_wins] += 1
    "Computer wins!"
  elsif user_selection == "rock" && computer_selection == "scissors"
    session[:user_wins] += 1
    "Player wins!"
  elsif user_selection == "rock" && computer_selection == "paper"
    session[:computer_wins] += 1
    "Computer wins!"
  elsif user_selection == "scissors" && computer_selection == "paper"
    session[:user_wins] += 1
    "Player wins!"
  elsif user_selection == "scissors" && computer_selection == "rock"
    session[:computer_wins] += 1
    "Computer wins!"
  end

end

get "/" do

  if session[:computer_wins].nil?
    session[:computer_wins] = 0
  end
  if session[:user_wins].nil?
    session[:user_wins] = 0
  end

  @computer_wins = session[:computer_wins]
  @user_wins = session[:user_wins]
  @message = session[:message]
  @computer_choice = session[:computer_choice]
  session[:computer_choice] = nil
  @player_choice = session[:player_choice]
  session[:player_choice] = nil

  unless session[:match_winner].nil?
    @winner = session[:match_winner]
    session.clear
  end

  erb :index
end

post "/selection" do

  if session[:computer_wins].nil?
    session[:computer_wins] = 0
  end
  if session[:user_wins].nil?
    session[:user_wins] = 0
  end

  selection = params[:selection].downcase
  session[:message] = detect_round_winner(selection)


  if session[:computer_wins] > 1
    session[:match_winner] = "Computer"
  elsif session[:user_wins] > 1
    session[:match_winner] = "Player"
  end

  redirect "/"

end

post "/clear" do
  session.clear
  redirect "/"
end
