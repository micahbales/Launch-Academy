require 'reptile'

class Python

  include Reptile

  attr_reader :name, :speak

  def initialize(name)
    @name = name
  end

  def speak
    "SSSSssssss..."
  end

end
