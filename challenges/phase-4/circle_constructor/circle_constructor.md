### Part I

Create a `Circle` class with a constructor that requires a single argument.
This argument should be the `radius` of the circle.

You should be able to replicate output similar to the following pry session using this new
constructor. Remember to save this code in a `circle.rb` file.

```no-highlight
$ pry
pry(main)> require_relative "circle"
=> true
pry(main)> Circle.new(4)
=> #<Circle:0x007f91658be478 @radius=4>
pry(main)> Circle.new(5.5)
=> #<Circle:0x007f9165b1fc08 @radius=5.5>
```

{% show_solution %}
```ruby
class Circle
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end
end
```
{% endshow_solution %}

### Part II

Create a completely different version of your `Circle` class that requires a
single argument. This time, allow the developer to specify whether the value
supplied is the diameter or the radius of the circle. You should only store the
`Circle`'s radius.

```no-highlight
pry(main)> Circle.new({radius: 4})
=> #<Circle:0x007f9164142538 @radius=4>
pry(main)> Circle.new({radius: 5.5})
=> #<Circle:0x007f9164138c90 @radius=5.5>
pry(main)> Circle.new({diameter: 12})
=> #<Circle:0x007f916585df10 @radius=6>
```

You should be able to replicate output similar to the following pry session using this new
constructor.

{% show_hint %}
* Given the curly braces in the examples above,
  what kind of data structure are you dealing with as it pertains to this version of the
  constructor?
{% endshow_hint %}

{% show_solution %}
```ruby
class Circle
  attr_reader :radius

  def initialize(input)
    if input[:radius].nil?
      @radius = input[:diameter]/2
    else
      @radius = input[:radius]
    end
  end
end
```

It is important to note that we are no longer passing `radius` as an argument, but we are passing `input` as an argument, because the input can be either a radius hash or a diameter hash. We still set our `@radius` instance variable to a certain value depending on which hash (diameter or radius) is given as an argument.

{% endshow_solution %}

### Extra Credit: Part III

Ruby allows us to check the type of an object through the use of
the `kind_of?` method.

```ruby
"a string example".kind_of?(String) => true
1.kind_of?(Fixnum) => true
[].kind_of?(Array) => true
```

Modify your constructor to make use of the `kind_of?` method.
Your `Circle` class supports both setting a radius as the exclusive, numeric argument to
the constructor and the ability to specify a diameter or radius as an option.
This portion will combine the functionalities of both parts I and II.

You should be able to replicate output similar to the following pry session using this new
constructor.

```no-highlight
pry(main)> Circle.new(4)
=> #<Circle:0x007f9165b1e6a0 @radius=4>
pry(main)> Circle.new(5.5)
=> #<Circle:0x007f9165ab5010 @radius=5.5>
pry(main)> Circle.new({radius: 4})
=> #<Circle:0x007f9165a4fa08 @radius=4>
pry(main)> Circle.new({radius: 5.5})
=> #<Circle:0x007f91659eef28 @radius=5.5>
pry(main)> Circle.new({diameter: 12})
=> #<Circle:0x007f91659951a8 @radius=6>
```

{% show_solution %}
```ruby
class Circle
  attr_reader :radius

  def initialize(input)
    if input.kind_of?(Hash)
      if input[:radius].nil?
        @radius = input[:diameter] / 2
      else
        @radius = input[:radius]  
      end
    else
      @radius = input
    end
  end
end
```

Here's a more concise implementation:

```ruby
class Circle
  attr_reader :radius

  def initialize(options_or_radius)
    if options_or_radius.kind_of?(Hash)
      @radius = options_or_radius[:radius] || (options_or_radius[:diameter] / 2)
    else
      @radius = options_or_radius
    end
  end
end
```

Recall that `nil` is a "falsy" value. We can use the `||` operation like we did
above to say "If the value on the left side of the `||` is nil, use the value on
the right side. We do that in the above example to say "If a radius is specified
as an option, use it. Otherwise, look for a diameter option and divide it by 2"

{% endshow_solution %}
