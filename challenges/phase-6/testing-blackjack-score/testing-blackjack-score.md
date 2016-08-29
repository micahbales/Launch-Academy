## Black Jack Unit Testing

### Introduction

When playing cards at the casino, accuracy is of extreme importance. One number off could be the matter of thousands or millions of dollars lost. For this exercise, we are going to write unit tests for the method that calculates the total of a hand in blackjack.

Why do we ask you to do this? Writing good tests allows you to make sure the behavior you expect -- within your methods, classes, etc. -- is actually happening. Thinking about your tests first also gives you direction in the design process of your code.

Basically, tests enable you to write your actual code more efficiently and smartly! They also make debugging way less frustrating down the line as you build bigger and bigger programs.

### RSpec

The testing framework we'll use for this exercise is [RSpec](http://rspec.info/). RSpec is a DSL (Domain Specific Language) that makes writing tests easier and more semantic. It is heavily used in the Rails community.

The RSpec [documentation](https://relishapp.com/rspec) is a great place to start learning what methods are available to you when writing tests. Look through `rspec-core` and `rspec-expectations`. Avoid the `rspec-mocks` and `rspec-rails` sections for now.


### Getting Started

There is already a `Deck` class set up with some tests. You'll find those tests in the `deck_spec.rb` file inside the `spec` folder. Take a few minutes to carefully read through those tests. We've provided some hints and suggestions (in the form of code comments) to get you started!

Then, check out the `hand_spec.rb` file. Begin writing the tests for the `#calculate_hand` method in the `Hand` class. In case you've never played blackjack, a score is calculated by adding up the values of the cards in a player's hand. Face cards (Jack, Queen, King) are worth 10 points and Aces are worth either 1 point or 11 points (whichever value yields the best score).

When you've written your tests for the `#calculate_hand` method, run the tests and watch them fail. Now comes the fun part: Write code to make those tests pass, one by one! Remember to run your test suite early and often.

Install the dependencies:

```
$ bundle
```

Run the test suite:

```
$ rspec spec
```
