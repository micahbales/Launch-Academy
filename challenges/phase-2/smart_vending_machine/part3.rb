puts "Hello, I'm the first and only Talking Vending Machine."
puts "What would you like today?"
print ">"

vend_item = gets.chomp

puts "How many of those would you like today?"

quantity = gets.chomp


if !quantity.index("tons").nil?
  random_number = rand(14).to_i

  while random_number != 0 do
    puts vend_item
    random_number = rand(14).to_i
  end
else
    quantity.to_i.times do
      puts vend_item
    end
end

puts "There you go! Come again!"
