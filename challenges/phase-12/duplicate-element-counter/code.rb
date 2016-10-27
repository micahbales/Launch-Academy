def duplicate_counter(array)
  counts = {}
  duplicates = 0

  array.each do |item|
    if counts[item].nil?
      counts[item] = 1
    else
      counts[item] += 1
    end
  end
  
  array.uniq.each do |item|
    if counts[item] > 1
      duplicates += counts[item] - 1
    end
  end

  duplicates
end

puts duplicate_counter([1, 7, 7, 7, 3, 5])
puts duplicate_counter([5, 7, 9])
puts duplicate_counter([0,-5,-5,33,33,33])
