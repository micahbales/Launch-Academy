# Rectangle Time!

In this exercise, we'll get some practice writing a class from scratch. This one might be useful to our old friend Mrs. Fisher for her Geometry class! (Remember her?)

## What Skills You'll Practice

- Writing a class from scratch
- Keeping track of a class instance's attributes, like its width or height
- Using an `attr_reader` to give yourself access to an object's attributes
- Writing a method that uses a class instance's state to make a calculation

### Part I

Open a new file, and in it, define a new `class` that represents a `Rectangle`. Save this as `rectangle.rb`.

A `Rectangle` should require two arguments, the `width` and the `height`.
This information should be retained as part of each instance's **state**, sometimes called its **attributes**.

You should be able to replicate output similar to the following pry session using this new
constructor.

```no-highlight
$ pry
pry(main)> require_relative "rectangle"
=> true
pry(main)> Rectangle.new(5, 6)
=> #<Rectangle:0x007f8dc4165ef0 @width=5, @height=6>
pry(main)> Rectangle.new(4, 6)
=> #<Rectangle:0x007f8dc50d09f8 @width=4, @height=6>
pry(main)> Rectangle.new(4, 8)
=> #<Rectangle:0x007f8dc4071b98 @width=4, @height=8>
```

{% show_solution %}
```ruby
class Rectangle
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end
```
{% endshow_solution %}

### Part II

Modify your `Rectangle` class so that it only requires a single argument, but
allows an optional, second argument.
If a single argument is specified, assume the `Rectangle` is a
square, where both the `width` and `height` are equal.

```no-highlight
pry(main)> Rectangle.new(5, 6)
=> #<Rectangle:0x007ff97324e180 @width=5, @height=6>
pry(main)> Rectangle.new(8, 6)
=> #<Rectangle:0x007ff9732456c0 @width=8, @height=6>
pry(main)> Rectangle.new(9)
=> #<Rectangle:0x007ff97323de48 @width=9, @height=9>
pry(main)> Rectangle.new(12)
=> #<Rectangle:0x007ff973235338 @width=12, @height=12>
```

{% show_solution %}
```ruby
class Rectangle
  attr_reader :width, :height

  def initialize(width, height = nil)
    @width = width
    if height.nil?
      @height = width
    else
      @height = height
    end
  end

end
```
{% endshow_solution %}

### Part III

Extend your `Rectangle` class to include a method that calculates any given `Rectangle` object's area based on its width and height.

You should be able to replicate output similar to the following pry session using this method.

```no-highlight
pry(main)> rectangle = Rectangle.new(5, 6)
=> #<Rectangle:0x007ff359182b18 @width=5, @height=6>
pry(main)> rectangle.area
=> 30
pry(main)> another_rectangle = Rectangle.new(9)
=> #<Rectangle:0x007ff359878e68 @width=9, @height=9>
pry(main)> another_rectangle.area
=> 81
```

{% show_hint %}
* The area of rectangle is defined as its `width` multiplied by its `height`
* You will require a method in order to calculate, set, and maintain the
  Rectangle instance's area. Use `attr_reader` to make the `width` and `height` of your Rectangle available to that method.
{% endshow_hint %}

{% show_solution %}
```ruby
class Rectangle
  attr_reader :width, :height

  def initialize(width, height = nil)
    @width = width
    if height.nil?
      @height = width
    else
      @height = height
    end
  end

  def area
    @area = width * height
  end
end
```
{% endshow_solution %}
