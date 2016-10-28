def bracket_match?(string)
  count = 0

  if string.include? "("
    count += 1
  end

  if string.include? ")"
    count += 1
  end

  if count > 1
    return true
  else
    return false
  end

end

bracket_match?("Hi! What is your name again (I forgot)?")
bracket_match?("Hi! What is (your name again? I forgot")
