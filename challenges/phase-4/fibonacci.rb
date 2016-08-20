def fibonacci(n)
  second_to_last_num = 0
  last_num = 1
  current_num = 0

  numbers = []
  numbers << current_num

  n.times do
    second_to_last_num = last_num
    last_num = current_num
    current_num = second_to_last_num + last_num
    numbers << current_num
  end
  numbers
end

puts fibonacci(50g)
