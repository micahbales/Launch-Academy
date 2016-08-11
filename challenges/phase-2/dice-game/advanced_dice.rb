input = ""

while input != "n" do
  puts "How many sides do your dice have?"
  sides = gets.chomp.to_i
  puts "How many times would you like to roll your dice?"
  rolls = gets.chomp.to_i

  rolls.times do
    die1 = rand(sides) + 1
    die2 = rand(sides) + 1
    total = die1 + die2

    puts "You rolled a #{die1} and a #{die2}"
    puts "Total: #{total}"
  end



  puts "Roll again? (y/n)"
  input = gets.strip
end
