class Dwelling

  attr_reader :address, :city, :state, :zip

  def initialize(address, city, state, zip)
    @address = address
    @city = city
    @state = state
    @zip = zip
  end
end
