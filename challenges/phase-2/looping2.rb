# create a variable that will hold the total price
total = 0
puts "Go ahead and enter some prices - we'll total it!\n"
puts "When you're done, just type \"done\""
input = gets.chomp

# loop until the user is done entering prices
while input !="done" do
  total += input.to_f
  # print out the current total price
  puts "Total so far: $#{total}"
  # ask the user for a price, or if they are done
  puts "Add another price, or type \"done\""
  # get the price
  input = gets.chomp
  # add the price to the total
# end loop
end

# print the final total price
puts "Grand total: $#{total}"
