def greet(name, language = nil)

  if language == "spanish"
    greeting = "Hola"
  elsif language == "italian"
    greeting = "Ciao"
  elsif language == "french"
    greeting = "Bonjour"
  else
    list_of_greetings = ["Hi", "Yo", "Hey", "Howdy"]
    greeting = list_of_greetings.sample
  end

  return "#{greeting}, #{name}!"
end

puts "What is your name?"
name = gets.chomp

puts "Which language do you prefer? (English, Spanish, Italian, French)"
language = gets.chomp.downcase

puts greet(name, language)
