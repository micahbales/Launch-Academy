game_results = [
  { par: 5, score: 7 },
  { par: 4, score: 5 },
  { par: 3, score: 3 },
  { par: 4, score: 4 },
  { par: 4, score: 4 },
  { par: 3, score: 2 },
  { par: 4, score: 5 },
  { par: 5, score: 5 },
  { par: 4, score: 5 },
  { par: 5, score: 7 },
  { par: 4, score: 4 },
  { par: 4, score: 4 },
  { par: 3, score: 3 },
  { par: 4, score: 5 },
  { par: 4, score: 5 },
  { par: 4, score: 4 },
  { par: 3, score: 3 },
  { par: 5, score: 6 }
]

total_score = 0
total_par = 0

game_results.each do |hole_hash|
  total_score += hole_hash[:score]
  total_par += hole_hash[:par]
end

puts "Total Strokes: #{total_score}"
puts "Total Par: #{total_par}"

par_value = total_score - total_par

term = ""
if par_value >= 0
  term = "over"
else
  term = "under"
  par_value = par_value * -1
end

puts "You were #{par_value} #{term} par."
