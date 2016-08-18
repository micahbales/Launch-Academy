def perimeter(width, height = nil)
  if height.nil?
    return width * 4
  else
    return 2 * width + 2 * height
  end
end

puts perimeter(4, 5)
puts "===="
puts perimeter(4, 4)
