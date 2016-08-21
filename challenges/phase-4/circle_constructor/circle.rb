class Circle

  attr_reader :radius

  def initialize(argument)
    if argument.kind_of?(Hash)
      if argument[:radius].nil?
        @radius = argument[:diameter] / 2
      else
        @radius = argument[:radius]
      end
    else
      @radius = argument
    end
  end
end


# Part 1:
#
# class Circle
#
#   attr_reader :radius
#
#   def initialize(radius)
#     @radius = radius
#   end
#
# end
