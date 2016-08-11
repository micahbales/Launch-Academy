total = 0

puts "Enter your values here:"

while total < 100 do
  puts ">"
  new_value = gets.chomp
  total += new_value.to_f
end

puts "You reached 100!"
