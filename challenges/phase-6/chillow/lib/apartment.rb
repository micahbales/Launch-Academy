require 'dwelling'
require 'fillempty'

class Apartment < Dwelling

  include FillEmpty

  attr_reader :rent, :total, :lease_start_date, :lease_end_date

  def initialize(address, city, state, zip, rent, lease_start_date, lease_end_date)
    @rent = rent
    super(address, city, state, zip)
    @total = []
    @capacity = 3
  end

  def remove
    super
    name = @removed_item.first_name
    "#{name} has left the building"
  end

end
