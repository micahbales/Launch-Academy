def disclaimer
  return "***DISCLAIMER***""
This code may not work the way you expect it to.
By using this temperamental program, you agree not to
sue the pants off of its creator.
***"
end

while true do
  puts disclaimer
  puts "You must accept our disclaimer to proceed! Do you accept? (y/n)"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "3 + 2 = #{rand(6)}"
    break
  end
end
