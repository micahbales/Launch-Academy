class Circle

  attr_reader :radius, :diameter, :area, :perimeter, :x, :y

  def initialize(radius, x = 0, y = 0)
    @radius = radius
    @x = x
    @y = y
    @diameter = 2 * radius
    @area = Math::PI * (radius * radius)
    @perimeter = 2 * Math::PI * radius
  end

end

class Square

  attr_reader :length, :width, :x, :y, :diameter, :area, :perimeter

  def initialize(length, x = 0, y = 0)
    @length = length
    @width = length
    @x = x
    @y = y
    @diameter = length * Math.sqrt(2)
    @area = length * length
    @perimeter = length * 4
  end

  def contains_point?(x,y)
    (x < @length && y < @length) && (x >= 0 && y >= 0)
  end

end
