golf_data = {}

golf_data["Hole 1"] = [{par: 5}, {strokes: 7}]
golf_data["Hole 2"] = [{par: 4}, {strokes: 5}]
golf_data["Hole 3"] = [{par: 3}, {strokes: 3}]
golf_data["Hole 4"] = [{par: 4}, {strokes: 4}]
golf_data["Hole 5"] = [{par: 4}, {strokes: 4}]
golf_data["Hole 6"] = [{par: 3}, {strokes: 2}]
golf_data["Hole 7"] = [{par: 4}, {strokes: 5}]
golf_data["Hole 8"] = [{par: 5}, {strokes: 5}]
golf_data["Hole 9"] = [{par: 4}, {strokes: 5}]
golf_data["Hole 10"] = [{par: 5}, {strokes: 7}]
golf_data["Hole 11"] = [{par: 4}, {strokes: 4}]
golf_data["Hole 12"] = [{par: 4}, {strokes: 4}]
golf_data["Hole 13"] = [{par: 3}, {strokes: 3}]
golf_data["Hole 14"] = [{par: 4}, {strokes: 5}]
golf_data["Hole 15"] = [{par: 4}, {strokes: 5}]
golf_data["Hole 16"] = [{par: 4}, {strokes: 4}]
golf_data["Hole 17"] = [{par: 3}, {strokes: 3}]
golf_data["Hole 18"] = [{par: 5}, {strokes: 6}]

total_strokes = 0
golf_data.each do |key, value|
  total_strokes += value[1][:strokes]
end

total_par = 0
golf_data.each do |key, value|
  total_par += value[0][:par]
end


puts "Total Strokes: #{total_strokes}"
puts "Total Par: #{total_par}"
puts "You were #{total_strokes - total_par} over par."

puts golf_data.inspect
