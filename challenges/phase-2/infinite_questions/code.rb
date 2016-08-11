require 'pry'

input =""

while input != "no" do
  puts "Can I get you anything?"
  print ">"
  input = gets.chomp
  binding.pry
end

puts "Okay, bye!"
