items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"

puts "What item would you like?"
item = gets.chomp
item_index = items_we_have.index(item)

if item_index.nil?
  puts "We don't have that item"
else
  puts "Item index:"
  puts item_index
end
