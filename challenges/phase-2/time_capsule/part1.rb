puts "Howdy, user! What's your name?"
name = gets.chomp

puts "Thanks, #{name}. What would you like to add to the time capsule?"
puts "(Please type 'FINISHED' when you are done) \n \n"

time_capsule = Array.new
item = gets.chomp
puts "Fantastic. What else?"

while item != "FINISHED" do
  time_capsule.push(item)
  item = gets.chomp
  puts "Fantastic. What else?"
end

puts "Great! Here are the contents of your time capsule: \n \n"
time_capsule.each do |item|
  puts "* #{item}"
end
puts "\n"
