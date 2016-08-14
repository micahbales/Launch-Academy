### Introduction

In this challenge, you will use methods defined on the
[Array class](http://ruby-doc.org/core/Array.html) to answer questions about
a list of names.


### Learning Objectives

* Review the Array data structure.
* Use one-line block syntax to answer questions about a collection.
* Use the `each`, `each_with_index`, `inject`, `map`, and other block-oriented methods


### Instructions

```no-highlight
$ et get array-one-line-methods
$ cd array-one-line-methods
```

In this folder you will find a `code.rb` file with a number of questions, which
you will answer using code.

```
# code.rb

names = [
  "John",
  "Hannah",
  "Mark",
  "Sam",
  "Anna",
  "Sandra",
  "Susan",
  "Julie",
  "Yanni",
  "Eve",
  "Sunny",
  "Matt"
]

## Accessing elements within our `names` array:

# 1. Retrieve the first name from the `names` array.
# 2. Retrieve the second name from the `names` array.
# 3. Retrieve the third name from the `names` array.

# ...
```

Example solution to the first question:

```
# 1. Retrieve the first name from the `names` array.
puts "The first name in the array is #{name[0]}"
```


### Tips

* Answer as many of these as you can using the knowledge you have gained from
previous lessons.
* Don't be afraid to reference past exercises and challenges, as well as the
[Ruby Docs](http://ruby-doc.org/core/Array.html), to help you solve these problems.
* If you get stuck on one question for awhile, skip it and try to answer the
next question.
* Reach out for hints and help on Slack.
* If you have finished, or If you're totally stuck, check out the video solution...


{% show_solution %}

### Video

{% vimeo_video '152503953' %}


### Timestamps

* 00:00 - Introduction
* 00:50 - Review the Array data structure, selecting items in the array.
* 05:00 - Using a range to select items from an array.
* 06:10 - Appending items to an array.
* 08:30 - Reading Ruby documentation
* 12:00 - Using the `.each_with_index` method.
* 18:47 - The `.sort` and `.inspect` methods.
* 23:00 - The `.sort_by` method.
* 27:00 - Sum the lengths of names in the array
* 29:23 - The `.inject` method.
* 33:45 - The `.any?` and `.start_with?` methods.
* 38:15 - Are all of the names 3 characters long or larger?
* 41:35 - The `.select` method.
* 43:20 - Find the first name that starts with 'S'.
* 47:50 - Create a new array containing names that start with 'S'.
* 49:15 - Create a new array of names ending with a vowel.
* 51:10 - The `.slice` method.
* 52:50 - Wrap up.

{% endshow_solution %}
