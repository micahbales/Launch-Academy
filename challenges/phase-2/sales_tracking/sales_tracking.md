### Introduction

To track your success, you want to write a program that lets you know once
you have reached $100 of sales. Using a `while` loop, write a program that allows
you to type in numbers to the command line, one by one, until the sum of those
numbers is at least 100.


### Example Output

```no-highlight
Enter your values here!
> 50
> 20.50
> 0.75
> 31.0
You've reached 100!
```

{% show_solution %}
```ruby
puts "Enter your values here!"

total = 0.0
while total < 100 do
  print "> "
  input = gets.chomp.to_f
  total = total + input
end

puts "You've reached 100!"
```
{% endshow_solution %}
