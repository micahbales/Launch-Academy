class Round
  def initialize(user_selection)
    @player_score = session[:player_wins] || 0
    @computer_score = session[:computer_wins] || 0
    @choices = [user_selection, computer_selection]
  end

  def score_round
    winner = determine_winner_of_round

    session[:player_wins] = player_score
    session[:computer_wins] = computer_score
    session[:message] = message
    session[:winner] = "#{winner.capitalize} wins the game!!" if victory?
  end

  private

  attr_reader :user_selection, :message, :player_score, :computer_score

  def computer_selection
    %w(rock paper scissors).sample
  end

  def determine_winner_of_round
    case [user_selection, computer_selection]

    when ["paper", "rock"], ["rock", "scissors"], ["scissors", "paper"]
      player_wins
    when ["paper", "scissors"], ["rock", "paper"], ["scissors", "rock"]
      computer_wins
    else
      tie
    end
  end

  def player_wins
    player_score += 1
    message = "Player wins!"
    "Player"
  end

  def computer_wins
    computer_score += 1
    message = "Computer wins!"
    "Winner"
  end

  def tie
    message = "Tie!"
  end

  def victory?
    player_score == 2 || computer_score == 2
  end
end
