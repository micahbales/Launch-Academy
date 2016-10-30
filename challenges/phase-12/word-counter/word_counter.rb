text_file = ARGV[0]
number_of_words = ARGV[1].to_i

if ARGV.size > 1
  puts "Here be the top #{number_of_words} words we've recovered from ye Briney Deep:"

  words_hash = {}
  File.open(text_file, "r") do |file|
    data = file.read
    sanitized = data.gsub(/[,.!?;:*&"]/, '').downcase

    words = sanitized.split
    words.each do |word|
      if words_hash[word]
        words_hash[word] += 1
      else
        words_hash[word] = 1
      end
    end
  end

  File.open("stop_words.txt", "r") do |file|
    data = file.read
    stop_words = data.split

    stop_words.each do |stop_word|
      if words_hash[stop_word]
        words_hash[stop_word] = 0
      end
    end
  end

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
