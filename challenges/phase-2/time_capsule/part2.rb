puts "Howdy, user! What's your name?"
name = gets.chomp

puts "\nThanks, #{name}. What would you like to add to the time capsule?"
puts "(Please type 'FINISHED' when you are done) \n \n"

time_capsule = Array.new
quantity = Array.new
item = ""

while true do
  item = gets.chomp

  if item != 'FINISHED'
    time_capsule.push(item)
    puts "\nAnd how many #{item} would you like to add?"
    count = gets.chomp
    int_count = count.to_i
    if int_count >= 1
      quantity.push(count)
      puts "\nFantastic. What else?"
    else
      time_capsule.pop
      puts "\nSorry, the quantity must be at least one (1). Try again!"
      puts "What would you like to add to the time capsule?"
    end
  else
    puts "\nGreat! Here are the contents of your time capsule (and their quantity): \n \n"
    i = 0
    while i < time_capsule.length do
      puts "* #{time_capsule[i]} (#{quantity[i]})"
      i += 1
    end
    puts "\n"
    break
  end
end
