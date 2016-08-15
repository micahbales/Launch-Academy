require "pry"

acronyms = {
  "EST" => "Eastern Standard Time",
  "EOF" => "End of File",
  "SSN" => "Social Security Number",
  "UFO" => "Unidentified Flying Object",
  "NASA" => "National Aeronautics and Space Administration",
  "MTV" => "Music Television",
  "DAEMON" => "Disk And Execution Monitor"
}

acronyms.each do |key, value|
  puts "#{key}: #{value}"
end

# acronyms.each_key do |key|
#   print "#{key} , "
# end

# keys = []
# acronyms.each_key do |key|
#   keys << key
# end
#
# puts keys.join(', ')

puts acronyms.keys.join(', ')
puts acronyms.values.join(', ')
