i = 1
primes = Array.new

while i < 100 do
  if i % 2 != 0
    primes.push(i)
  end
  i+=1
end

puts primes
