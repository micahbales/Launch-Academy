puts "How many feet wide is your driveway?"
width = gets.chomp.to_f

puts "How many feet long is your driveway?"
length = gets.chomp.to_f

puts "How many inches of snow are there on your driveway?"
depth = gets.chomp.to_f

cubic_feet = width * length * (depth/12)

if cubic_feet < 50
  price = 20
elsif cubic_feet >= 50 && cubic_feet < 150
  price = 50
elsif cubic_feet >= 150 && cubic_feet < 300
  price = 100
else
  price = 150
end

puts "Cubic Feet: #{cubic_feet}"
puts "Quote Price: $#{price.to_f}"
