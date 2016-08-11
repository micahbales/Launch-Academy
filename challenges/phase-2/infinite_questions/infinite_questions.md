### Part 1

Time to get some customers some snacks! Write a program that asks your
customer if you can get them anything, and then accepts their input. If
they typed anything other than "no", the loop should run again! After the
loop ends, say goodbye.

### Example Output

```no-highlight
Can I get you anything?
> A soda, please
Can I get you anything?
> Nah, that's okay.
Can I get you anything?
> Shut up you stupid machine!
Can I get you anything?
> Oh god, this will never end will it...
Can I get you anything?
> no
Okay, bye!
```

{% show_solution %}
```ruby
while answer != "no" do
  puts "Can I get you anything?"
  print "> "
  answer = gets.chomp
end

puts "Okay, bye!"
```
{% endshow_solution %}


### Part 2

Now that people are using your program, it's time to have some fun and mess with
some users. On the line after you store the user's answer, insert a
`binding.pry` statement. Now, run the program. Allow the loop to run a couple
times. (You can press CTRL-D in pry to move onto the next run of the loop!)
When you decide you want to mess with a user's answer, use pry to set the
variable `answer` to "no" and thus exit from the loop.

{% show_solution %}
```ruby
require 'pry'

while answer != "no" do
  puts "Can I get you anything?"
  print "> "
  answer = gets.chomp
  binding.pry
end

puts "Okay, bye!"
```

```no-highlight
> ruby code.rb
Can I get you anything?
> Yes please!
pry > CTRL-D
Can I get you anything?
> Cookies sound delicious!
pry > CTRL-D
Can I get you anything?
> I'd love some ice cream!
pry > answer = "no"
pry > CTRL-D
Okay, bye!
```
{% endshow_solution %}
