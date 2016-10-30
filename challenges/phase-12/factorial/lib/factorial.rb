def factorial(number)
    if number == 0
        1
    else
        number * factorial(n-1)
    end
end

x = factorial(3) # 6
y = factorial(4) # 24
z = factorial(5) # 120

# 6 * 5 * 4 * 3 * 2 * 1
