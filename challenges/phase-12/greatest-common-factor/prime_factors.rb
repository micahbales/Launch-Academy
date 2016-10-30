require 'prime'

def prime_factors_of(number)

  prime_factors = []
  Prime.each(number) do |prime_number|

    if number % prime_number == 0
      prime_factors << prime_number
    end
  end
  return prime_factors
end
