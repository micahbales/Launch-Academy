#Given a sentence find the longest word

long_string = "Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
##puts long_string

word_array = long_string.split(' ')
#puts word_array.inspect

#build a new array consisting of character lengths

word_lengths = word_array.map do |word|
  word.size
end

#puts word_lengths.inspect
# #puts word_lengths.max

longest_word_index = -1
longest_word_length = -1

word_lengths.each_with_index do |word, index|
  if word > longest_word_length
    longest_word_length = word
    longest_word_index = index
  end
end

# #puts longest_word_length
# #puts longest_word_index

#puts word_array[longest_word_index]

#scenario: using the 'sort_by'

sorted_word_array = word_array.sort_by {|word| word.size}
#puts sorted_word_array.inspect
#puts sorted_word_array.last

# Given a sentence, find the most common letter used

# Transform the sentence into an array of characters
character_array = long_string.split('')
# puts character_array.inspect
# Create an array of 26 zeros
char_counts = []
26.times do
  char_counts << 0
end
# puts char_counts.inspect

# Iterate through the list of characters
character_array.each do |char|
  if char.ord > "a".ord && char.ord <= "z".ord
    char_counts[char.ord - "a".ord] += 1
  end
end
# puts char_counts.inspect

# Find the maximum character count
char_index = -1
max_chars = -1
char_counts.each_with_index do |count, index|
  if count > max_chars
    max_chars = count
    char_index = index
  end
end

# Output the correlating character
char = (char_index + "a".ord).chr
#puts "The most frequent character is #{char}"

# Decoder ring: You're given a string of numbers 1-27
# 1-26 for alphabet, 27 represents space
# Decode the message:
# 7 15 15 4 24 4 15 7
# "good dog"

encoded_message = "7 15 15 4 27 4 15 7"
digits = encoded_message.split(' ')
# puts digits.inspect

#loop through each digit and find its character equivalent

characters = digits.map do |digit_string|
  num = digit_string.to_i
  if num == 27
    ' '
  else
    (96 + num).chr
  end
end
# puts digits.inspect
# puts characters.inspect
# puts characters.join('')


# Given a random array of numbers
# return a new array containing
# only the prime numbers found in the collection

random_numbers = []

10.times do
  random_numbers << rand(9) + 1
end

#loop through each generated number
#for each number determine if it is divisible by any other number than 1 & self
primes = Array.new
prime = true
random_numbers.each do |num|
  (2...num).to_a.each do |divisor|
    if num % divisor == 0
      prime = false
      puts "#{num} is not prime"
      break
    end
  end
  if prime
    primes << num
  end
end
primes.each do |prime|
  puts "#{prime} is a prime number"
end
