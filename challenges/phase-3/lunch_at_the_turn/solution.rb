menu = {
  "Hamburger" => 400,
  "Hot Dog" => 300,
  "Fries" => 200,
  "Chips" => 100,
  "Water" => 125,
  "Soda" => 150
}

items = []
puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?
"
order = gets.chomp
items = order.split(",")

total = 0
items.each do |item|
  total += menu[item]
end

puts "Thanks! Your total is $#{'%.2f' % (total / 100.to_f)}. Have a nice day!"

