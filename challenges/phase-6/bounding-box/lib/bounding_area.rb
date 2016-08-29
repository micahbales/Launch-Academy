class BoundingArea


  def initialize(bounding_boxes = [])
    @bounding_boxes = bounding_boxes
  end

  def boxes_contain_point?(x, y)

    if @bounding_boxes.length == 0
      false
    else
      @bounding_boxes.each do |bounding_box|
        if bounding_box.contains_point?(x, y)
          return true
        end
      end
      return false
    end
  end
end
