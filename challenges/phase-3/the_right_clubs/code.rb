REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]
required_clubs = [:driver, :pitching_wedge, :putter]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)

puts "***Automated Golf Club Advice:\n"

possible_club_selections.each do |club|
  puts "Use the #{club.to_s.gsub('_', ' ')}!"
end

possible_club_selections.each do |club|
  required_clubs.each do |required|
    if club == required
      puts "WARNING! You will be without a #{club.to_s.gsub('_', ' ')}"
    end
  end
end
