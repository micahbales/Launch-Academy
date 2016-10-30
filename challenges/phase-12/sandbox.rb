require 'pry'

def bubble_sort(to_sort)
  sorted = false

  until sorted
      sorted = true

      for index in 0..(to_sort.length - 2)
        if to_sort[index] > to_sort[index + 1]
          sorted = false
          to_sort[index], to_sort[index + 1] = to_sort[index + 1], to_sort[index]
        end
      end
  end

  puts to_sort.inspect
end

bubble_sort([7, 9, 12, 1, 13, -2])
