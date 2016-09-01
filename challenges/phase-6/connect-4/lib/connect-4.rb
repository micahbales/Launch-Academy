require 'pry'
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
puts "OK, #{player2_name}. You'll play as #{player2_marker}\n"

player1 = Player.new(player1_name, player1_marker)
player2 = Player.new(player2_name, player2_marker)

game_board = Board.new
puts game_board.display_board

puts "\nOK, #{player1.name}! Select a column (A-J) where you'd like to place your marker!"
column_selection = gets.chomp.upcase

while column_selection != "A" && column_selection != "B" && column_selection != "C" &&
  column_selection != "D" && column_selection != "E" && column_selection != "F" &&
  column_selection != "G" && column_selection != "H" && column_selection != "I" &&
  column_selection != "J"
  puts "Please pick a column between A and J"
  column_selection = gets.chomp.upcase
end

puts game_board.drop_marker(column_selection, player1.marker)

puts "\nYour move has been placed!\n\n"
puts game_board.display_board
