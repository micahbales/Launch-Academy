food = {
  hamburger: 4,
  hot_dog: 3,
  fries: 2,
  chips: 1,
  water: 1.25,
  soda: 1.50
}

puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?"
order = gets.chomp.downcase

total = 0.to_f

if order.include? "hamburger"
  total += food[:hamburger]
end
if order.include? "hot dog"
  total += food[:hot_dog]
end
if order.include? "fries"
  total += food[:fries]
end
if order.include? "chips"
  total += food[:chips]
end
if order.include? "water"
  total += food[:water]
end
if order.include? "soda"
  total += food[:soda]
end


puts "Your total is: $#{total}"
