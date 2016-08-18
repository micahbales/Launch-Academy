def average(grades)
  sum = 0
  grades.each do |grade|
    sum += grade.to_f
  end
  return average = sum / grades.length
end

def letter_grade(average)
  if average >= 90
    return "A"
  elsif average < 90 && average >= 80
    return "B"
  elsif average < 80 && average >= 70
    return "C"
  elsif average < 70 && average >= 60
    return "D"
  else
    return "F"
  end
end

def ranking(students)
  students.each_with_index do |student, index|
    rank = index + 1
    puts "#{rank}. #{student}"
  end
  puts
end


jane_grades = [98,95,88,97,74]
samantha_grades = [85,93,98,88,49]
matt_grades = [87,93,89,97,65]

puts "Jane's average is: #{average(jane_grades)}% Her class grade is: #{letter_grade(average(jane_grades))}"
puts "Samantha's average is: #{average(samantha_grades)}% Her class grade is: #{letter_grade(average(samantha_grades))}"
puts "Matt's average is: #{average(matt_grades)}% His class grade is: #{letter_grade(average(matt_grades))}"

students = ["Johnny", "Jane", "Sally", "Elizabeth", "Michael"]

ranking(students)
