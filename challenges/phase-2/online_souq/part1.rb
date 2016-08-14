puts "Howdy shopper? What's your name?"
name = gets.chomp

items = ["old paperback book", "potato", "red onion", "dried lemon", "frankincense", "medicinal herbs", "saffron",
  "glass spice jar", "red fabric", "orange fabric", "handicrafts", "small Persian rug", "medium Persian rug",
  "large Persian rug", "extra large Persian rug"]

puts "Welcome, #{name}! We offer the following items: \n \n"

items.each do |item|
  puts "* #{item}"
end
puts "\n"

user_items = []

puts "So what would you like to buy?"
puts "Type 'FINISHED' when you've told me everything"

input = ""

while input != "FINISHED" do
  input = gets.chomp
  if items.include?(input)
    user_items.push(input)
    puts "\nGreat, #{input} is one of my favorites."
    puts "What else? \n \n"
  else
    puts "\nSorry, we don't have #{input}. What else can I get you? \n \n"
  end
end

puts "Very well! You have selected: \n \n"

user_items.each do |item|
  puts "* #{item}"
end
puts "\n"
