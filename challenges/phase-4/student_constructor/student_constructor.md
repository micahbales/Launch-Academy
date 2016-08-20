### Part I: Many Arguments

Let's create a class that helps us keep track of a student and the information associated with them, like their name and grades.

Define the class and constructor that allows you to replicate the pry
output below. Your constructor will require three arguments:

* The student's first name
* The student's last name
* The student's list of grades

```no-highlight
$ pry
pry(main)> require_relative "student"
=> true
pry(main)> Student.new('John', 'Smith', [90, 100, 85])
=> #<Student:0x007f8dc5398898 @first_name="John", @last_name="Smith", @grades=[90, 100, 85]>
pry(main)> Student.new('Jane', 'Doe', [85, 100, 100])
=> #<Student:0x007f8dc53427b8 @first_name="Jane", @last_name="Doe", @grades=[85, 100, 100]>
```

{% show_solution %}

```ruby
class Student
  attr_reader :first_name, :last_name, :grades

  def initialize(first_name, last_name, grades)
    @first_name = first_name
    @last_name = last_name
    @grades = grades
  end
end
```

{% endshow_solution %}

### Part II: One Argument

Create a completely different definition of your `Student` class. This time,
require one argument to the constructor. This argument should represent the
relevant data required to provide a student's first name, last name, and list of
grades.

You should be able to replicate output similar to the following pry session using this new
constructor.

```no-highlight
pry(main)> Student.new({first_name: 'John', last_name: 'Smith', grades: [90, 100, 85]})
=> #<Student:0x007f8dc50d9328 @first_name="John", @last_name="Smith", @grades=[90, 100, 85]>
pry(main)> Student.new({first_name: 'Jane', last_name: 'Doe', grades: [85, 100, 100]})
=> #<Student:0x007f8dc410cf08 @first_name="Jane", @last_name="Doe", @grades=[85, 100, 100]>
```

{% show_hint %}
* Given the curly braces in the examples above,
  what kind of data structure are you dealing with as it pertains to this version of the
  constructor?
{% endshow_hint %}

{% show_solution %}

```ruby
class Student
  attr_reader :first_name, :last_name, :grades

  def initialize(information_hash)
    @first_name = information_hash[:first_name]
    @last_name = information_hash[:last_name]
    @grades = information_hash[:grades]
  end
end
```

{% endshow_solution %}

### Part III: Maintain the average in `Student` State

Modify the constructor you created in **Part II** to also calculate the
student's average. Store that result in the instance's state.

```no-highlight
pry(main)> Student.new({first_name: 'John', last_name: 'Smith', grades: [90, 100, 85]})
=> #<Student:0x007f86fd92a028 @first_name="John", @last_name="Smith", @grades=[90, 100, 85], @average=91.66666666666667>
pry(main)> Student.new({first_name: 'Jane', last_name: 'Doe', grades: [85, 100, 100]})
=> #<Student:0x007f86fc09b430 @first_name="Jane", @last_name="Doe", @grades=[85, 100, 100], @average=95.0>
```

{% show_solution %}

```ruby
class Student
  attr_reader :first_name, :last_name, :grades

  def initialize(information_hash)
    @first_name = information_hash[:first_name]
    @last_name = information_hash[:last_name]
    @grades = information_hash[:grades]
    @average = calculate_average
  end

  def calculate_average
    sum_of_grades = 0.0
    @grades.each do |grade|
      sum_of_grades += grade
    end
    sum_of_grades/@grades.length
  end
end
```

{% endshow_solution %}
