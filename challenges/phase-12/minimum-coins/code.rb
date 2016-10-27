def minimum_coins(number)

  coin_options = [1, 5, 10, 25, 50, 100]
  total = 0
  number_of_coins = 0

  while total < number

    coin_options.reverse.each do |coin|
      if coin + total <= number
        total += coin
        number_of_coins += 1
        break
      end
    end
  end
  number_of_coins
end

puts minimum_coins(35)
puts minimum_coins(37)
puts minimum_coins(101)
