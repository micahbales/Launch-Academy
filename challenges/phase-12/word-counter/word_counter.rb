require 'pry'

text_file = ARGV[0]
number_of_words = ARGV[1].to_i

if ARGV.size > 1
  puts "Here be the top #{number_of_words} words we've recovered from ye Briney Deep:"

  words_hash = {}
  f = File.open(text_file, "r")
  f.each_line do |line|
    words = line.split(' ')
    words.map! { |word| word[/\w+/] }
    words.each do |word|
      if words_hash[word]
        words_hash[word] += 1
      else
        words_hash[word] = 1
      end
    end
  end
  f.close

  top_words_hash =
  words_hash.sort_by { |key, value| value }
  .reverse[0..number_of_words - 1]

  i = 1
  top_words_hash.each do |w|
    puts "#{i}. #{w[0]}: #{w[1]}"
    i += 1
  end
else
  puts "Ahoy, Maties! We need two ARRRguments!"
  puts "Provide a treasure chest and a key!"
end
