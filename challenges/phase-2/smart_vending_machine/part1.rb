puts "Hello, I'm the first and only Talking Vending Machine."
puts "What would you like today?"
print ">"

vend_item = gets.chomp

puts "How many of those would you like today?"

quantity = gets.chomp.to_i

quantity.times do
  puts vend_item
end

puts "There you go! Come again!"
