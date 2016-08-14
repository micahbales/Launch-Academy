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

available_items = []
unavailable_items = []

puts "So what would you like to buy?"
puts "Type 'FINISHED' when you've told me everything"

input = ""

while input != "FINISHED" do
  input = gets.chomp
  if items.include?(input)
    available_items.push(input)
    puts "\nGreat, #{input} is one of my favorites."
    puts "What else? \n \n"
  else
    puts "\nSorry, we don't have #{input}. What else can I get you? \n \n"
    unavailable_items.push(input)
  end
end

puts "#{name}, thanks for trying our online Souq platform. Here is a list of the items in
your cart!: \n \n"

available_items.each do |item|
  puts "* #{item}"
end
puts "\n"

puts "Btw, we noticed you tried entering in some items that aren't part of the online
Souq. We don't have the following items yet but will let you know if they show
up!: \n \n"

unavailable_items.each do |item|
  puts "* #{item}"
end
puts "\n"
