Let's stop and grab some lunch between holes nine and ten!

Here's the menu:

```no-highlight
Hamburger $4.00
Hot Dog $3.00
Fries $2.00
Chips $1.00
Water $1.25
Soda $1.50
```

Write a program that takes your order and gives you the total cost.

Sample Output:

```no-highlight
Welcome to Goodburger, home of the Goodburger! Can I take your order?
#> Hamburger,Fries,Chips
Thanks! Your total is $7.00. Have a nice day!
```

As an extra challenge, be sure to handle for an invalid entry:

```no-highlight
Welcome to Goodburger, home of the Goodburger! Can I take your order?
#> Hamburger,Buffalo Wings,Chips
Sorry! We don't have 'Buffalo Wings' on the menu.
Welcome to Goodburger, home of the Goodburger! Can I take your order?
#> Hamburger,Chips
Thanks! Your total is $5.00. Have a nice day!
```

{% show_solution %}
Without checking for bad entry:

```ruby
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
```

Checking for bad entry:
```ruby
menu = {
  "Hamburger" => 400,
  "Hot Dog" => 300,
  "Fries" => 200,
  "Chips" => 100,
  "Water" => 125,
  "Soda" => 150
}

items_not_found = nil
items = []
while items_not_found.nil? || !items_not_found.empty?
  puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?
"
  order = gets.chomp
  items = order.split(",")

  items_not_found = items - menu.keys

  if !items_not_found.empty?
    items_not_found.each do |item|
      puts "Sorry! We don't have '#{item}' on the menu."
    end
  end
end

total = 0
items.each do |item|
  total += menu[item]
end

puts "Thanks! Your total is $#{'%.2f' % (total / 100.to_f)}. Have a nice day!"
```
{% endshow_solution %}
