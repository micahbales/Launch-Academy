class Student

  attr_reader :student_info, :first_name, :last_name, :grades, :average

  def initialize(student_info)

    @student_info = student_info
    @first_name = student_info[:first_name]
    @last_name = student_info[:last_name]
    @grades = student_info[:grades]
    @average = student_info[:grades].reduce(:+).to_f / student_info[:grades].length
  end
end

# Part 1:

# class Student
#
#   attr_reader :first_name, :last_name, :grades
#
#   def initialize(first_name, last_name, grades = [])
#     @first_name = first_name
#     @last_name = last_name
#     @grades = grades
#   end
# end
