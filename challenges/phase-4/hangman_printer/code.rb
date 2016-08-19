def word_to_dashes(word)
  dashes = ""
  word.length.times do
    dashes += "-"
  end
  dashes
end
def reveal_guessed_characters(word, guessed_characters)
  guessed_characters = guessed_characters.split('')
  word = word.split('')

  word.each_with_index do |letter, index|
    if !guessed_characters.include?(letter)
      word[index] = "-"
    end
  end

  return word.join('')
end
def print_puzzle(word, guessed_characters = nil)
  if guessed_characters.nil?
    word_to_dashes(word)
  else
    reveal_guessed_characters(word, guessed_characters)
  end
end
puts "Choose a word:"
user_word = gets.chomp.downcase
puts print_puzzle(user_word)
puts "Which letters would you like to reveal?"
guessed_characters = gets.chomp.downcase
puts print_puzzle(user_word, guessed_characters)
