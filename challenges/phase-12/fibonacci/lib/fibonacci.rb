def fibonacci(n)

  if n <= 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end

end

puts s = fibonacci(1) # 1
puts t = fibonacci(2) # 1
puts u = fibonacci(3) # 2
puts v = fibonacci(4) # 3
puts w = fibonacci(5) # 5
puts x = fibonacci(6) # 8
puts y = fibonacci(8) # 21
puts z = fibonacci(13) #233

# 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610
