def minimum_consecutive_integers(array)

  input_array = array.sort

  low = input_array[0]
  high = input_array[-1]

  big_array = Array(-1000..1000)
  big_array += input_array

  inner_values = []
  big_array.each do |value|
    unless value < low || value > high
      inner_values.push(value)
    end
  end

  inner_values.delete_if { |value| value == high || value == low }

  puts inner_values.length
end

minimum_consecutive_integers([1, 3])
minimum_consecutive_integers([2, 5])
minimum_consecutive_integers([-1, 4])
