The legal department now requires all of your software to output a disclaimer before
the running of your program. To save your fellow developers on the team some trouble,
you decide to write a method that does this for you and others.

Your `disclaimer` method should output the following text:

```no-highlight
***DISCLAIMER***
This code may not work the way you expect it to.
By using this temperamental program, you agree not to
sue the pants off of its creator.
***
```

Here is the code to your existing program. You're still working out the bugs.

```ruby
puts "3 + 2 = #{rand(6)}"
```

{% show_solution %}
```ruby
def disclaimer
  puts "***DISCLAIMER***"
  puts "This code may not work the way you expect!"
  puts "By using this temperamental program, you agree not to"
  puts "sue the pants off of its creator."
  puts "***"
  puts ""
end

disclaimer
puts "3 + 2 = #{rand(6)}"
```
{% endshow_solution %}

Uh oh! The lawyers are back and they're getting increasingly anxious.
They have requested that you require the user to accept the disclaimer before running
the program. If the user does not accept the disclaimer, the attorneys want to ensure their
safety by reaffirming the disclaimer and requiring that the user accept.

To be extra safe, they also want you to output the disclaimer after the program has completed.

Sample Output:

```no-highlight
***DISCLAIMER***
This code may not work the way you expect!
By using this temperamental program, you agree not to
sue the pants off of its creator.
***

You must accept our disclaimer to proceed! Do you accept? (y/n)
n
***DISCLAIMER***
This code may not work the way you expect!
By using this temperamental program, you agree not to
sue the pants off of its creator.
***

You must accept our disclaimer to proceed! Do you accept? (y/n)
n
***DISCLAIMER***
This code may not work the way you expect!
By using this temperamental program, you agree not to
sue the pants off of its creator.
***

You must accept our disclaimer to proceed! Do you accept? (y/n)
y

3 + 2 = 0

***DISCLAIMER***
This code may not work the way you expect!
By using this temperamental program, you agree not to
sue the pants off of its creator.
***
```

{% show_solution %}
```ruby
def disclaimer
  puts "***DISCLAIMER***"
  puts "This code may not work the way you expect!"
  puts "By using this temperamental program, you agree not to"
  puts "sue the pants off of its creator."
  puts "***"
  puts ""
end

response = 'n'
while response.downcase != 'y'
  disclaimer
  puts "You must accept our disclaimer to proceed! Do you accept? (y/n)"
  response = gets.chomp
end

puts ""
puts "3 + 2 = #{rand(6)}"
puts ""

disclaimer
```
{% endshow_solution %}
