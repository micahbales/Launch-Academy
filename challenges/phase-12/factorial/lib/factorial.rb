def factorial(number, accumulator = 1)
  if number == 0
    puts 1
  elsif number < 2
    puts accumulator
  else
    accumulator *= number
    factorial(number - 1, accumulator)
  end
end

factorial(3) # 6
factorial(4) # 24
factorial(5) # 120

# 6 * 5 * 4 * 3 * 2 * 1
