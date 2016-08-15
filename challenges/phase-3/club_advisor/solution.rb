distances = {
  driver: 200,
  three_wood: 180,
  five_wood: 170,
  two_iron: 170,
  three_iron: 160,
  four_iron: 150,
  five_iron: 140,
  six_iron: 130,
  seven_iron: 120,
  eight_iron: 110,
  nine_iron: 95,
  pitching_wedge: 80,
  sand_wedge: 20,
  putter: 0
}

puts "How far away are you?"
current_distance = gets.chomp.to_i

distances.each do |club, distance|
  if distance <= current_distance
    puts "Use the #{club.to_s.gsub("_", " ")}!"
    break
  end
end

