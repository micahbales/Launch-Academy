# Chillow

Every year on September 1st, the city of Boston's streets become a snarl of moving trucks and illegally parked vehicles with mattresses precariously tied to their roofs. At least one undergraduate's rented behemoth from U-Haul gets [Storrowed](http://www.urbandictionary.com/define.php?term=storrowed), and the locals shake their heads and hide in their long-term-leased apartments until things blow over. (Well, unless they plan to raid [Allston Christmas](http://www.urbandictionary.com/define.php?term=allston+christmas)).

You're the lead developer of a new and *disruptive*(!) app, Chillow (like a similarly named competitor, only...chill-er), that is going to change how the denizens of Boston look for housing, seeking to soothe the madness that is September 1st. But first, you have to figure out how you're going to model the data you need to accomplish this task.

## Learning Goals
* Reinforce understanding of object oriented composition
* Practice using modules and recognizing patterns that necessitate them
* Practice using inheritance
* Learning to write unit tests that cover included modules

## Before You Start

Make sure you run `bundle install` before beginning.

## What to Do

A TDD technique for this challenge will help you understand what the requirements of your objects and methods are before beginning. You should write a unit test, make it fail, and then write the code that makes the test pass for each class and its methods.

You'll need to start with four classes and their attendant tests. Put these in the `lib` folder of this directory.

First, `Occupant`s, who have a first and last name. `Dwelling` is any kind of housing. It should have an address, a city/town, a state, and a zip code. `House` and `Apartment` have all the things that `Dwelling`s have, but a `House` has an asking price and an `Apartment` has a rent per month price. `Apartment`s should also have a lease start date and a lease end date.

Our business model will depend on matching apartment hunters who want to share their space with available vacancies. Therefore, `Apartment` should have a `full?` method to check to see if there are vacant spaces in that apartment, an `add_roommate` method that adds a new `Occupant`, and a `remove_roomate` that removes an `Occupant`.

In summary:

```
Occupant
- first_name
- last_name

Dwelling
- address
- city_or_town
- state
- zip_code

House
- address
- city_or_town
- zip_code
- asking_price

Apartment
- address
- city_or_town
- zip_code
- rent
- lease_start_date
- lease_end_date
- full?
- add_roommate
- remove_roommate
```

Start with writing a test for the `Occupant` object, and then writing its class in the files provided. Follow the pattern set in them to create the rest of your classes and tests.

## Next up, global dominat--er, moving trucks!

Not too bad, right? Business is booming! Our app has differentiated itself from many others (for reasons that are slightly mysterious to all involved) and it's time to expand our reach. The newest area of our business will be actually helping with the moving part of things! We'll make it more efficient by allowing `Occupant`s belongings to "carpool" with others.

We're going to need some trucks. Make a `Truck` class that specifies how many boxes it can hold (and a `Box` class that stores the name of its owner, which should be an `Occupant` object) and stores these `Box` objects in an array. Make sure the `Truck` has a method to check if it is `full?`, one to `add_box`, and one to `remove_box`. Also give the `Truck` a method to unload all the boxes of a particular `Occupant` at once.

## Refactor Time!

Notice anything interesting about some of the methods that `Apartment` and `Truck` both have? They check if each respective object is full, remove one person or box from them, or add the same. This kind of shared functionality across disparate classes is sometimes an indicator that a module could DRY up the code.

> "When you're designing a program and you identify a behavior or set of behaviors that may be exhibited by more than one kind of entity or object, you've found a good candidate for a module." (*The Well-Grounded Rubyist*, David Black, pg. 94).

### First, Refactor Your Tests

Refactor the tests from `Apartment` and `Truck` that involve moving items in and out and checking for capacity to use more generic method names. Once the tests are failing, write a module that will make the tests pass again. Don't worry about testing the module itself--test its integrations in your classes.

## Diving Deeper

Ultimately, decisions about using modules versus inheritance and other ways of abstracting and sharing functionality are opinions about design. There are many ways to implement any given solution. If you want to learn more at a high level about using modules and inheritance in Ruby, here are some resources you may find useful.

* Chapters 6, 7, & 8 of Sandi Metz's [Practical Object Oriented Design in Ruby](http://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330) are a comprehensive and nuanced look at design principles when using inheritance, modules, and considering concerns of composition. The entire book is an authoritative must-read on OOP in Ruby that will help you go from newbie to professional!
* Chapter 4 of [*The Well-Grounded Rubyist*](http://www.amazon.com/The-Well-Grounded-Rubyist-David-Black/dp/1933988657) by David A. Black offers a lucid and practical discussion of modules and class composition, along with some great examples.
* For a short read that gives a little more information, Zed Shaw has a nice exercise and discussion about [inheritance and composition](http://learnrubythehardway.org/book/ex44.html) from *Learn Ruby the Hard Way*.





