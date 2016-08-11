input = ""

while input != "S" do

  die1 = rand(6) + 1
  die2 = rand(6) + 1
  total = die1 + die2

  puts "You rolled a #{die1} and a #{die2}"
  puts "Total: #{total}"

  puts "Press 'Enter' to roll again, 'S' to stop"
  input = gets.strip
end
