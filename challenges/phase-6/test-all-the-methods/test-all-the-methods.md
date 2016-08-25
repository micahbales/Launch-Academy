![Test All The Methods](https://s3.amazonaws.com/horizon-production/images/test_all_the_methods.jpg)

In this portion of the curriculum, we have practiced building many different kinds of methods.
Now that we know how to write tests, we should go back and write tests for all of our methods to ensure that they are working as expected and that they continue to work as expected even if they are refactored in the future.
We have added some of these methods to the `code.rb` file. Furthermore, we have also added a couple of new methods which need tests as well.

## Getting set up
While in your `challenges` folder, run the following in the command line

```no-highlight
et get test-all-the-methods
cd test-all-the-methods
bundle
rspec
open coverage/index.html
```

In your browser, click on the `code.rb` link that has a magnifying glass next to it for a visual representation of the test coverage.

![simplecov output](https://s3.amazonaws.com/horizon-production/images/simplecov.png)

Your goal is to achieve 100% test coverage.

## Instructions

Your first step is to write a test case for the perimeter method in `spec/code_spec.rb`. Then, run `rspec` and refresh your browser. You should see the test coverage change.

```ruby
# spec/code_spec.rb

RSpec.describe "perimeter" do
  it "returns 20 for a square with a width of 5" do
    expect(perimeter(5)).to eq(20)
  end

  it "returns 30 for a rectangle with a width of 5 and a length of 10" do
    expect(perimeter(5, 10)).to eq(30)
  end
end
```

## Test your coverage with SimpleCov
How much testing is enough? One metric that programmers should strive for is 100% test coverage.
This means that every single line of our program's code has been executed by at least one test in our test suite.
[SimpleCov](https://github.com/colszowka/simplecov) is a handy gem that allows us to determine the percentage test coverage of our program.
SimpleCov has already been set up for you in this exercise.
Every time you update your tests, re-run your tests and refresh the analysis file in your browser to see the change in test coverage.
You should be aware that even if 100% test coverage is achieved, your code might still need additional tests.
For each method, you should test that you are obtaining all the possible expected return values based on the method's input arguments, if any.

## Resources
[RSpec built-in matchers](http://www.relishapp.com/rspec/rspec-expectations/v/3-4/docs/built-in-matchers)

