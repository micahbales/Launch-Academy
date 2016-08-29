class BoundingBox

  attr_reader :x, :y, :width, :height

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def left
    @x
  end

  def right
    @x + width
  end

  def top
    @y + height
  end

  def bottom
    @y
  end

  def contains_point?(x, y)
    if (x >= @x && x <= (@x + width)) &&
      (y >= @y && y <= (@y + height))
      true
    else
      false
    end
  end

end
