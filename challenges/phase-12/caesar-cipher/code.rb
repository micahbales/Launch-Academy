def caesar_cipher(string, number)

  message = string.split('')
  cipher = []

  message.each do |letter|
    char_code = letter.ord
    if (char_code >= 65 && char_code <= 90)
      sum = char_code + number
      if sum <= 90
        cipher.push(sum.chr)
      else
        excess = sum - 90
        sum = excess + 64
        cipher.push(sum.chr)
      end
    elsif (char_code >= 97 && char_code <= 122)
      sum = char_code + number
      if sum <= 122
        cipher.push(sum.chr)
      else
        excess = sum - 122
        sum = excess + 96
        cipher.push(sum.chr)
      end
    else
      cipher.push(letter)
    end
  end
puts cipher.join('')
end

caesar_cipher("a", 2)
caesar_cipher("z", 2)
caesar_cipher("Caesar", 2)
caesar_cipher("Abracadabra!?!?! Why, that's extracalafragalisticexpialidocious!", 25)
