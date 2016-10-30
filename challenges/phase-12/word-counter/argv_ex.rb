# Example usage of the ARGV constant

if ARGV.size > 0
  puts "There were #{ARGV.size} arguments given. Here they are:"
  ARGV.each_with_index do |argument, i|
    puts "  #{i}. #{argument}"
  end
else
  puts "No arguments were given."
end
