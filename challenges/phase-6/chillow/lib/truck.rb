require 'fillempty'

class Truck

  include FillEmpty

  attr_reader :total, :capacity

  def initialize(capacity)
    @total = []
    @capacity = capacity
  end

  def remove_all(first_name, last_name)
    total.each do |box|
      if box.owner.first_name == first_name && box.owner.last_name == last_name
        @total.delete(box)
      end
    end
  end
end
