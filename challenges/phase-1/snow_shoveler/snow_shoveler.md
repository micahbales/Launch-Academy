### Introduction

You have a snow shoveling business and decide to write a program to help
you build quotes for clients.

In order to test your new program, the first quote you build will be for your
neighbor. You charge clients by the cubic foot of snow. The driveway of your neighbor's house
is 8 ft wide and 20 ft long. The last snowstorm dropped 8 inches of snow in total.

Here is your initial pricing chart:

```no-highlight
0 - 49 cubic ft:  $20
50 - 149 cubic ft: $50
150 - 299 cubic ft: $100
300+ cubic ft: $150
```

### Problem Statement

Write a program that displays how many cubic ft of snow dropped
in a driveway and how much it will cost the clients for you to
clear out the snow.

{% show_hint %}
  - cubic ft is measured: side X side X side
  - when converting inches to ft make sure to use Floats
{% endshow_hint %}

Example Output:

```no-highlight
Cubic Feet: 106.66666666666666
Quote Price: $50
```


### A Note on Edge Cases

What should happen if the amount of snow calculated is 49.4 cubic feet?
Should we charge $20 or $50?

This is a common scenario when solving problems with code. We have an
**edge case** that is not described by our pricing chart, and it is up to us
to determine how to handle it.

A reasonable solution here is to round to the nearest cubic foot. Take a
look a the `round` method, which is defined on the
[Float class](http://ruby-doc.org/core-2.1.2/Float.html#method-i-round).

{% show_hint %}
* You will need to utilize a complex `if` / `else` statement to set the
appropriate price after the cubic feet is calculated.
{% endshow_hint %}


{% show_solution %}
```ruby
width = 8.0 # feet
length = 20.0 # feet
height = 8.0 / 12.0 # inches converted to feet

cubic_feet = width * length * height

if cubic_feet < 50
  price = 20
elsif cubic_feet < 150
  price = 50
elsif cubic_feet < 300
  price = 100
else
  price = 150
end

puts "Cubic Feet: #{cubic_feet}"
puts "Quote Price: $#{price}"
```
{% endshow_solution %}


### Video Solution

{% vimeo_video "124954508" %}
