require 'pry'

names = [
  "John",
  "Hannah",
  "Mark",
  "Sam",
  "Anna",
  "Sandra",
  "Susan",
  "Julie",
  "Yanni",
  "Eve",
  "Sunny",
  "Matt"
]

## Accessing elements within our `names` array:

# 1. Retrieve the first name from the `names` array.
puts names[0]
# 2. Retrieve the second name from the `names` array.
puts names[1]
# 3. Retrieve the third name from the `names` array.
puts names[3]
# 4. Retrieve the last name from the `names` array.
puts names.last
# 5. Retrieve the second-to-last name from the `names` array.
puts names[-2]
# 6. Create a new array with the first two elements in the `names` array.
newArray = names[0..1]
puts newArray
# 7. Create a new array with the first four elements in the `names` array.
newArray = names[0..3]
puts newArray
## Manipulating the `names` array:

# 1. Add your name to the `names` array.
puts names.push("Micah")
# 2. Replace the first element in the array with your best friend's name.
puts names[0].replace("Ryan")
# 3. Reassign the last element in the array with the name of your arch-nemesis.
puts names.last.replace("Emily")

## Asking questions about our `names` array:
names.pop

# 1. How many names are on the list?
puts names.length
# 2. Who is the third name on the list?
puts names[2]
# 3. Output each name and where it occurs in the array.
names.each {|name| puts "#{name} is at index #{names.index(name)}"}
# 4. Sort the names in alphabetical order.
puts names.sort
# 5. Sort the names by smallest number of characters to largest.
names.sort {|x,y| x.length <=> y.length}
# 6. Supply the sum of all the characters in the list of names.
names.inject(0) {|sum, name| sum + name.length}
# 7. Do any of the names start with "y"?
there_is_y = names.any? do |name|
  name.start_with?("Y")
end
if there_is_y
  puts "There is a name that starts with Y"
else
  puts "There is no name that starts with Y"
end
# 8. Are all of the names 3 characters long or larger?
three_characters = names.each do |name|
  name.length >= 3
end
if three_characters
  puts "All names have at least 3 characters"
else
  puts "Not all names have at least 3 characters"
end
# 9. Using the `names` array, create a new array containing only palindrome names.
palindromes = []
names.each do |name|
  if name.downcase == name.reverse.downcase
    palindromes.push(name)
  end
end
if palindromes.empty?
  puts "There are no palindrome names"
else
  puts "There are #{palindromes.length} names that are palindromes:"
  puts palindromes
end
# 10. Find the first name that starts with "S".
s_name = ""
names.each do |name|
  if name.index("S") == 0
    s_name = name
    break
  end
end
puts "first name to start with 'S' is #{s_name}"
# 11. Create a new array containing names that start with "S".
s_names = []
names.each do |name|
  if name.index("S") == 0
    s_names.push(name)
  end
end
puts "These names start with 'S':"
puts s_names
# 12. Create a new array of names ending with a vowel.
vowels = ["a", "e", "i", "o", "u", "y"]
vowel_names = []
names.each do |name|
  vowels.each do |vowel|
    if name[-1] == vowel
      vowel_names.push(name)
    end
  end
end
puts "These names end in vowels:"
puts vowel_names
# 13. Divide the names into groups of 3.
puts "current:"
groups = names.each_slice(3) {|a| p a}
puts groups
