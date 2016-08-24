def plus_two(number)
  number + 2
end

def subtract_or_multiply_by_two(number)
  if number < 0
    number -= 2
  else
    number *= 2
  end
  number
end

def repeat_last_word(sentence)
  sentence += " " + sentence.split(' ').last
end

def return_value_of_type(symbol)
  if symbol == :string
    return "String"
  elsif symbol == :fixnum
    return rand(10)
  else
    return "input does not match any Ruby class"
  end
end

def add_five_and_ten(array)
  array.push(5,10)
end
