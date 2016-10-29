class StackUnderflow < StandardError
end

class Stack
  def initialize
    @contents = []
    @index = -1
  end

  def push(item)
    @index += 1
    @contents[@index] = item
  end

  def peek
    @contents[@index]
  end

  def pop
    raise StackUnderflow if empty?
    result = peek
    @index -= 1
    result
  end

  def empty?
    @index == -1
  end
end
