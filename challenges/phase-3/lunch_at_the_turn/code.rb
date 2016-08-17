require 'pry'

food = {
  "hamburger" => 4.00,
  "hot dog" => 3.00,
  "fries" => 2.00,
  "chips" => 1.00,
  "water" => 1.25,
  "soda" => 1.50
}

total = 0
error = false
error_item = ""

while error == true || total == 0 do
  puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?"
  order = gets.chomp.downcase
  order_array = order.split(',')



  order_array.each do |item|
    if food[item]
      total += food[item]
    else
      error = true
      error_item = item
    end
  end

  if error
    puts "Sorry! We don't have #{error_item} on the menu."
    error_item = ""
    error = false
  end
end

puts "Thanks! Your order is $#{total}. Have a nice day!"
