The results are in from all four precincts!

Mary Sue, Sally Jane, and Billy Joe all ran strong campaigns for
the highly coveted position of Representative to Those with First Names as Last Names.

The trouble is all of the results are coming in as a 2 dimensional array!
Mary Sue is dying to know if she won, so she's turned to you to make sense of the results.

Each row in the 2 dimensional array represents vote results for a
given precinct. Each item in the row represents the votes that Mary Sue,
Sally Jane, and Billy Joe received chronologically.

She wants to know:

* How many people voted in precinct 1?
* Who was the winning candidate in Precinct 4?
* How many people voted for Mary Sue?
* How many people voted for Billy Joe?
* How many people voted for Sally Jane?
* How many people voted in total?
* Who had the most votes?

To keep things interesting, below you will find some starting code that randomizes the vote results.

You should not have to modify the supplied code,
and don't worry about handling ties.

```ruby
#build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

#list out vote results
vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end

### put your code here
```

Sample output:

```no-highlight
**In precinct 1:**
* Mary Sue got 468 votes
* Sally Jane got 151 votes
* Billy Joe got 45 votes

**In precinct 2:**
* Mary Sue got 75 votes
* Sally Jane got 273 votes
* Billy Joe got 330 votes

**In precinct 3:**
* Mary Sue got 359 votes
* Sally Jane got 40 votes
* Billy Joe got 210 votes

**In precinct 4:**
* Mary Sue got 453 votes
* Sally Jane got 473 votes
* Billy Joe got 144 votes

Precinct 1 had 664 votes
Sally Jane won Precinct 4
Mary Sue had 1355 votes
Billy Joe had 729 votes
Sally Jane had 937 votes
There were 3021 votes in total
Mary Sue had the most votes (1355)
```

{% show_solution %}
```ruby
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end

### put your code here
precinct_one_sum = 0
vote_results[0].each do |votes|
  precinct_one_sum += votes
end

puts "Precinct 1 had #{precinct_one_sum} votes"

max_votes = vote_results[3].max
candidate_index = vote_results[3].index(max_votes)

puts "#{candidates[candidate_index]} won Precinct 4"

mary_sue_votes = 0
billy_joe_votes = 0
sally_jane_votes = 0
vote_results.size.times do |precinct_index|
  mary_sue_votes += vote_results[precinct_index][0]
  sally_jane_votes += vote_results[precinct_index][1]
  billy_joe_votes += vote_results[precinct_index][2]
end

puts "Mary Sue had #{mary_sue_votes} votes"
puts "Billy Joe had #{billy_joe_votes} votes"
puts "Sally Jane had #{sally_jane_votes} votes"

total_votes = mary_sue_votes + billy_joe_votes + sally_jane_votes
puts "There were #{total_votes} votes in total"

if mary_sue_votes > billy_joe_votes && mary_sue_votes > sally_jane_votes
  puts "Mary Sue had the most votes (#{mary_sue_votes})"
elsif billy_joe_votes > mary_sue_votes && billy_joe_votes > sally_jane_votes
  puts "Billy Joe had the most votes (#{billy_joe_votes})"
else
  puts "Sally Jane had the most votes (#{sally_jane_votes})"
end
```
{% endshow_solution %}
