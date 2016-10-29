require_relative 'stack'

class BracketMatcher
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def valid?
    params_array = @params.split('')

    if params_array.length % 2 != 0
      return false
    end
    middle_index = params_array.length / 2
    left_side = params_array.slice(0, middle_index)
    right_side = params_array.slice(middle_index, middle_index)

    middle_index.times do
      left = left_side.pop
      right = right_side.shift

      unless (left == "(" and right == ")") || (left == "{" && right == "}") || (left == "[" && right == "]")
        return false
      end
    end
    return true
  end

end
