Let's grab a cup of coffee at the diner next door. The waiter at the diner has requested that you model your coffee cup in the form of a Ruby instance before he serves you. So much for a night off!

### Part I - Model Your Cup

Create a constructor that instantiates your coffee cup with an amount of coffee
and a maximum capacity. Most cups support 12 oz and are filled up to 8 oz, so
use those as default values.

### Part II - Take a Sip and Handle Spills

Implement a `sip!` method that decreases the amount of coffee in your cup. It
should permanently affect the state of your coffee cup instance.

Output the error "Hey! You need a refill!" if there is no more coffee left to
sip.

Who brought the klutz? One of your friends knocked over your coffee cup!
Implement a `spill!` method that eliminates all of the coffee in your cup.

### Part III - Get a Refill

Implement a `refill!` method that refills your cup. The amount of coffee
refilled should always be 2 oz less than the maximum capacity of the cup.

### Part IV - Try Out Different Cup Sizes and Amounts!

The diner also has a policy that the maximum capacity of their cups must be greater than 2. (No espresso shots here!) Please keep this in mind as you create other instances of the `CoffeeCup` class and call your instance methods on them.

{% show_solution %}
```ruby
class CoffeeCup
  attr_accessor :amount, :max_amount

  def initialize(amount = 8, max_amount = 12)
    @amount = amount
    @max_amount = max_amount
  end

  def sip!
    if @amount > 0
      @amount -= 1
    else
      puts "Hey! You need a refill!"
    end
  end

  def spill!
    @amount = 0
  end

  def refill!
    @amount = @max_amount - 2
  end

  def to_s
    "There is #{@amount}oz of coffee left in your #{@max_amount}oz cup."
  end
end
```
{% endshow_solution %}
