##OMG We Need Emergency Brussels Sprouts!

We have run out of Brussels Sprouts! A recent drought in the West Coast has caused a shortage of our favorite ingredient. This is a problem.

Luckily, we have contacts in Belgium that can send us emergency shipments of Brussels Sprouts. However, we have to share our cargo with someone else who wants [Cheesy Poofs](https://www.youtube.com/watch?v=-XlYj1iyAlk). We need to be able to calculate weights and interact with the containers to plan our shipment accordingly.

###Learning Goals
* Use existing unit tests to guide the writing of methods that make the tests pass
* Observe how a set of unit tests set the stage for writing code to produce desired behavior

###Requirements and Contextual Information

Here are your assumptions:
* Each ingredient has a name and weight
  * A single Brussels Sprout weighs 20 grams.
  * A single Cheesy Poof weighs 0.5 grams.
* Each container has a weight, a maximum carrying capacity (max weight it can hold), and the ingredients it carries.
  * Each container can only carry one type of ingredient.
  * Brussels Sprouts-friendly containers weigh 90 kg and can carry a maximum weight of 140 kg.
  * Cheese Poof containers weigh 20 kg and can carry a maximum weight of 10 kg (they are very sturdy).

###Instructions

Unit tests that take into account the above requirements have already been written and included in this assignment. You'll need to take the following steps to get started:

1) Run `et get emergency-brussels-sprouts`. 

2) [Bundler](http://bundler.io/) is a Ruby dependency manager. You'll see this again in the future, but that's all you need to know for right now. First, run `gem install bundler`, and then run `bundle install` while in the directory for this challenge. This will install the `bundler` gem, and then it will read the `Gemfile` in this directory to install anything necessary to run our tests.

3) When you're ready to start writing code, run `rake`. Rake will run the `RSpec` tests that have been provided as part of this challenge. You'll also see rake again later, but you don't need to know more about it for now.

Now you're ready to go! The first test failure will look something like this:

```
➜  evening-oo-composition ✗ rake
/Users/mlg/.rubies/ruby-2.0.0-p576/bin/ruby -I/Users/mlg/.gem/ruby/2.0.0/gems/rspec-support-3.3.0/lib:/Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb
/Users/mlg/workspace/curriculum/onsite/evening-oo-composition/spec/lib/01_ingredient_spec.rb:3:in `<top (required)>': uninitialized constant Ingredient (NameError)
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1327:in `load'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1327:in `block in load_spec_files'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1325:in `each'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/configuration.rb:1325:in `load_spec_files'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:102:in `setup'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:88:in `run'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:73:in `run'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib/rspec/core/runner.rb:41:in `invoke'
  from /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/exe/rspec:4:in `<main>'
/Users/mlg/.rubies/ruby-2.0.0-p576/bin/ruby -I/Users/mlg/.gem/ruby/2.0.0/gems/rspec-support-3.3.0/lib:/Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/lib /Users/mlg/.gem/ruby/2.0.0/gems/rspec-core-3.3.2/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb failed

```

What is this error telling us? It seems that the `Ingredient` class doesn't exist yet! Add it to `lib/ingredient.rb` and re-run your test. You should get a new error. New errors are the way of measuring progress as you resolve the test suite. Follow the tests and allow them to help you decide what code needs to be written next.


###Tips
* Write your `Ingredient` class first, then your `Container` class.
* You'll want to use a [class method](https://learn.launchacademy.com/lessons/class-instance-methods) for converting a new ingredient's weight to kg.
* The number of Brussels Sprouts that a container holds should be whole numbers and not decimals.
* Remember that the weight of a container is both how much the container weighs and the weight of its total contents.
