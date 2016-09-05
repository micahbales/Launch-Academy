## Introduction

For this lesson, you will build the "Zooniverse", a fictional location from the
television series,
[*The Mighty Boosh*](http://www.bbc.co.uk/comedy/mightyboosh/clips/episodes_series1.shtml).

Let the tests drive your development.


## Objectives

* Building objects in Ruby
* Object composition
* Practice Test Driven Development (TDD)


## Instructions

Download the lesson with `et`, and run the test suite:

```no-highlight
$ et get oo-marathon
$ cd oo-marathon
$ bundle
$ rake spec
rake spec
/Users/rd/.rubies/ruby-2.0.0-p643/bin/ruby -I/Users/rd/.gem/ruby/2.0.0/gems/rspec-support-3.2.2/lib:/Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb
/Users/rd/launch/curriculum/lessons/oo-marathon/spec/spec_helper.rb:4:in `require_relative': cannot load such file -- /code/horizon/oo-marathon/lib/cage (LoadError)
  from /Users/rd/launch/curriculum/lessons/oo-marathon/spec/spec_helper.rb:4:in `<top (required)>'
  from /Users/rd/.rubies/ruby-2.0.0-p643/lib/ruby/site_ruby/2.0.0/rubygems/core_ext/kernel_require.rb:54:in `require'
  from /Users/rd/.rubies/ruby-2.0.0-p643/lib/ruby/site_ruby/2.0.0/rubygems/core_ext/kernel_require.rb:54:in `require'
  from /Users/rd/launch/curriculum/lessons/oo-marathon/spec/cage_spec.rb:1:in `<top (required)>'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/configuration.rb:1226:in `load'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/configuration.rb:1226:in `block in load_spec_files'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/configuration.rb:1224:in `each'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/configuration.rb:1224:in `load_spec_files'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/runner.rb:97:in `setup'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/runner.rb:85:in `run'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/runner.rb:70:in `run'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib/rspec/core/runner.rb:38:in `invoke'
  from /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/exe/rspec:4:in `<main>'
/Users/rd/.rubies/ruby-2.0.0-p643/bin/ruby -I/Users/rd/.gem/ruby/2.0.0/gems/rspec-support-3.2.2/lib:/Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/lib /Users/rd/.gem/ruby/2.0.0/gems/rspec-core-3.2.3/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb failed
```

This error message occurred because Ruby is looking for a file called `cage.rb`,
which doesn't exist, yet. Create this file, and you will get to the next step.

## Test-Driven Development

Let the tests guide you as you build the software:

##### Step 1: Red

```no-highlight
$ rake spec  # => failing test
```

##### Step 2: Green

Write some code to make the test pass.

```no-highlight
$ rake spec  # => passing test
```

##### Step 3: Refactor

Evaluate and improve what you have written. Refactor your code by extracting
duplication into methods. Extract functionality into classes.

Here's an artice on the concept of
[Red, green, refactor](http://blog.cleancoder.com/uncle-bob/2014/12/17/TheCyclesOfTDD.html).


## Wrap Up

After you've completed the exercise, watch us work through the challenge by
checking out the video solution, below.

{% show_solution %}
{% vimeo_video '153573063' %}
{% endshow_solution %}
