You've decided that secondary to writing code, selling snacks is your real
passion in life - which means it's time to write a high-tech Ruby vending
machine!

To keep track of the contents of your vending machine, you decide to store the
name of each item you have in one big string representing your inventory:

`items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"`

When a user enters a word representing which item they want, you need to
figure out where that item resides in the string!

Write a program that asks a user for an item they would like from the vending
machine. Once they type the word, check to see what its [index](http://ruby-doc.org/core-2.2.3/Array.html#method-i-index) is in the
string provided below. If the index exists (is not `nil`), print the index.
If the index is `nil`, print a line saying that you don't have that item.

####Example Output

It item exists:

```no-highlight
What item would you like?
> cheetos
Item index:
43
```

If item doesn't exist:

```no-highlight
What item would you like?
> coconuts
We don't have that item.
```

{% show_solution %}
```ruby
  items_we_have = "chips popcorn skittles clif bar mentos gum cheetos m&ms"
  puts "What item would you like?"
  input = gets.chomp
  item_index = items_we_have.index(input)
  if item_index.nil?
    puts "We don't have that item."
  else
    puts "Item index:"
    puts item_index
  end
```
{% endshow_solution %}
