require_relative 'prime_factors'

def greatest_common_factor(number1, number2)

  prime_factors_one = prime_factors_of(number1)
  prime_factors_two = prime_factors_of(number2)

  common_prime_factors = []
  prime_factors_one.reverse.each_with_index do |prime1, i|
    if prime1 == prime_factors_two.reverse[i]
      common_prime_factors << prime1
    end
  end

  factor1 = common_prime_factors.reverse[-1]
  factor2 = common_prime_factors.reverse[-2]

  if factor2
    puts factor1 * factor2
  elsif factor1
    if (factor1 * factor1) > number1 || (factor1 * factor1) > number2
      puts factor1
    else
      puts factor1 * factor1
    end
  else
    puts 1
  end
end

greatest_common_factor(8, 4) # 4
greatest_common_factor(8, 7) # 1
greatest_common_factor(81, 18) # 9
greatest_common_factor(788, 288) # 4
greatest_common_factor(765, 8901) # 9
greatest_common_factor(18, 24) # 6
greatest_common_factor(3, 9) # 3
