Your vending machine isn't very good at understanding people yet, so you've
decided it should ask people to repeat themselves at least three times when
asking for something.

Ask a user what they would like to order. After they answer, use a `times`
loop to ask "What did you say?" and allow them to type an answer at least
three times. After the last time, output "Oh, okay!"

{% show_solution %}
```ruby
puts "What do you want?"
gets.chomp

3.times do
  puts "What did you say?"
  gets.chomp
end

puts "Oh, okay!"
```
{% endshow_solution %}
