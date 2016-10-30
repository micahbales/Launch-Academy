## Instructions

Write a program to print out the most common words found in a text file. The program should print out the **n** most common words with their counts found in a given file where both the filename and **n** are supplied on the command line.

There are several sample e-books included with the challenge courtesy of [Project Gutenberg][gutenberg] that can be used to test out the word counter.

### Learning Goals

* Creating a program that accepts command-line arguments.
* Reading data from the file system.
* Utilizing hashes as an efficient data structure for counting.


### Sample Usage

Pass both the **filename** to read and the **number of words** you want printed out:

```no-highlight
$ ruby word_counter.rb poe_usher.txt 10

the: 553
of: 412
and: 240
i: 163
a: 156
in: 140
to: 118
which: 93
his: 86
was: 79
```


## Tips

### Getting Command-line Arguments

Ruby gives you a means to pass messages to your programs from the command line. The `ARGV` constant is an array of arguments the user typed in when executing your program.

```ruby
# argv_ex.rb

if ARGV.size > 0
  puts "There were #{ARGV.size} arguments given. Here they are:"
  ARGV.each_with_index do |argument, i|
    puts "  #{i}. #{argument}"
  end
else
  puts "No arguments were given."
end
```

```no-highlight
$ ruby argv_ex.rb
No arguments were given.
```

```no-highlight
$ ruby argv_test.rb flippity floppity floop
There were 3 arguments given. Here they are:
  0. flippity
  1. floppity
  2. floop
```

We can see that the `ARGV` constant captures all of the words given after the `ruby argv_test.rb` statement. Use this feature of the Ruby language to pass the **filename** and the **number of words** to your program.


### Sorting Collections of Things

The `sort_by` method can be used on a Hash to return an ordered set of key-value pairs. Note that this does not return another Hash but rather an Array of Arrays.


### Sanitizing Strings

Word counting is more effective if the input is sanitized first. This often involves stripping out most punctuation and downcasing all letters. The `gsub` method can be used to strip characters that don't match a particular pattern in a string.


## Bonus Challenge: Stop Words

Many of the most common words found in books do not have much significance. Words such as *the*, *and*, *of*, and so on appear frequently but do not provide much information about the work they appear in. These are often referred to as **stop words** and are usually ignored when parsing natural text.

As an additional challenge, ignore any of the words that appear in `stop_words.txt` when parsing the given file.


Program output after taking into account stop words:

```no-highlight
$ ruby word_counter.rb poe_usher.txt 20

upon: 53
now: 20
long: 19
usher: 19
yet: 18
thus: 16
one: 15
house: 14
certain: 12
character: 12
door: 12
however: 11
portion: 11
within: 11
even: 11
many: 11
wild: 10
words: 10
family: 9
shall: 9
```


## Resources

* [Ruby's ARGF - thoughtbot](https://robots.thoughtbot.com/rubys-argf)
* [Stripping non-alphanumeric chars - stackoverflow](http://stackoverflow.com/questions/10073332/stripping-non-alphanumeric-chars-but-leaving-spaces-in-ruby)
* [Reading files in Ruby - stackoverflow](http://stackoverflow.com/questions/5545068/what-are-all-the-common-ways-to-read-a-file-in-ruby)

[gutenberg]: https://www.gutenberg.org/
