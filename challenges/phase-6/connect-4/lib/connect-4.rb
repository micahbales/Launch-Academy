require_relative 'board'
require_relative 'player'
#Move
#Game

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
puts "OK, #{player2_name}. You'll play as #{player2_marker}"

player1 = Player.new(player1_name, player1_marker)
player2 = Player.new(player2_name, player2_marker)
