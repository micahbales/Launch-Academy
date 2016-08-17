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

precinct_1 = 0
vote_results[0].each do |result|
  precinct_1 += result
end
puts "Precinct 1 had #{precinct_1} votes"

precinct_4_results = vote_results[3]
most_votes = 0
winner_id = 0
precinct_4_results.each_with_index do |votes, index|
 if votes > most_votes
   most_votes = votes
   winner_id = index
 end
end

p4_winner = ""
if winner_id == 0
  p4_winner = "Mary Sue"
elsif winner_id == 1
  p4_winner = "Sally Jane"
else
  p4_winner = "Billy Joe"
end
puts "#{p4_winner} won Precinct 4"

mary_sue_total = 0
vote_results.each do |precinct|
  mary_sue_total += precinct[0]
end

puts "Mary Sue had #{mary_sue_total} votes"

sally_jane_total = 0
vote_results.each do |precinct|
  sally_jane_total += precinct[1]
end

puts "Sally Jane had #{sally_jane_total} votes"

billy_joe_total = 0
vote_results.each do |precinct|
  billy_joe_total += precinct[2]
end

puts "Billy Joe had #{billy_joe_total} votes"

grand_total = 0
vote_results.each do |precinct|
  precinct.each do |tally|
    grand_total += tally
  end
end

puts "There were #{grand_total} votes in total"

winner_total = mary_sue_total + sally_jane_total + billy_joe_total
if mary_sue_total > sally_jane_total && mary_sue_total > billy_joe_total
  winner = "Mary Sue"
elsif sally_jane_total > mary_sue_total && sally_jane_total > billy_joe_total
  winner = "Sally Jane"
else
  winner = "Billy Joe"
end

puts "#{winner} had the most votes (#{winner_total})"
