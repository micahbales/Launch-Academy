module FillEmpty

  def full?
    if @total.length >= @capacity
      true
    else
      false
    end
  end

  def add(item)
    if !full?
      @total << item
    else
      "Sorry, there's no room!"
    end
  end

  def remove
    @removed_item = @total.pop
    @removed_item
  end

end
