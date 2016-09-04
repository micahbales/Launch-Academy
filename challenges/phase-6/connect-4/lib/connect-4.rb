require_relative 'board'
require_relative 'player'

puts "Welcome to Connect-4!\nThis game requires two players.\n\nWhat is the name of Player 1?"
player1_name = gets.chomp

puts "Great, #{player1_name}! Would you prefer X or O?"
player1_marker = gets.chomp.upcase
while player1_marker != "X" && player1_marker != "O"
  puts "Please select X or O\n>"
  player1_marker = gets.chomp.upcase
end
player2_marker = player1_marker == "X" ? "O" : "X"
puts "#{player1_name} will play as #{player1_marker}"

puts "What is the name of Player 2?"
player2_name = gets.chomp
while player1_name == player2_name
  puts "You really have the same name? Pick a unique name"
  player2_name = gets.chomp
end
puts "OK, #{player2_name}. You'll play as #{player2_marker}\n\n"

player1 = Player.new(player1_name, player1_marker)
player2 = Player.new(player2_name, player2_marker)
current_player = player1

while true

  game_board = Board.new
  puts game_board.display_board

  while !game_board.win? && !game_board.tie?
    puts "\nOK, #{current_player.name}! Select a column (A-J) where you'd like to place your marker!"
    column_selection = gets.chomp.upcase

    if column_selection == "QUIT"
      break
    end

    while column_selection != "A" && column_selection != "B" && column_selection != "C" &&
      column_selection != "D" && column_selection != "E" && column_selection != "F" &&
      column_selection != "G" && column_selection != "H" && column_selection != "I" &&
      column_selection != "J"
      puts "Please pick a column between A and J"
      column_selection = gets.chomp.upcase
    end

    if !game_board.column_full?(column_selection)
      puts game_board.drop_marker(column_selection, current_player.marker)
      puts "\nYour move has been placed!\n\n"
      puts game_board.display_board
      current_player.name == player1.name ? current_player = player2 : current_player = player1
    else
      puts "Looks like that column is full! Try placing somewhere else."
    end
  end

  if game_board.win?
    current_player.name == player1.name ? current_player = player2 : current_player = player1
    puts "Congratulations, #{current_player.name}, you are the winner!\n\n"
    puts "Would you like to play again? (y/n)"
    play_again = gets.chomp.upcase
    if play_again != "Y"
      break
    end
  end

  if game_board.tie?
    puts "Nice try! The game ends in a tie!\n\n"
    puts "Would you like to play again? (y/n)"
    play_again = gets.chomp.upcase
    if play_again != "Y"
      break
    end
  end

end
