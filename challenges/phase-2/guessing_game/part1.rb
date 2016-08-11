puts "Welcome to the Guessing Game! What difficulty would you like to play?"
puts "Type easy or hard:"
print ">"
input = gets.chomp

while input != "easy" && input != "hard" do

  puts "Welcome to the Guessing Game! What difficulty would you like to play?"
  puts "Type easy or hard:"
  print ">"
  input = gets.chomp
end

if input == "easy"
  random_number = rand(10) + 1
  numbers = "1 and 10"
elsif input == "hard"
  random_number = rand(20) + 1
  numbers = "1 and 20"
end

puts "I've picked a number between #{numbers}. Now guess it!"
print ">"
guess = gets.chomp.to_i

while guess != random_number do
  puts "Nope, try again!"
  guess = gets.chomp.to_i
end

puts "You win! Nice job!"
