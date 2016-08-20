class Person

  attr_reader :first_name, :last_name, :middle_name

  def initialize(name, last_name = nil, middle_name = nil)

    if last_name.nil? && middle_name.nil?
      full_name = name.split(' ')
      if full_name.length > 2
        @first_name = full_name[0]
        @middle_name = full_name[1]
        @last_name = full_name[2]
      elsif full_name.length > 1 && full_name.length < 3
        @first_name = full_name[0]
        @last_name = full_name[1]
      else
        @first_name = full_name
      end
    elsif !last_name.nil? && middle_name.nil?
      @first_name = name
      @last_name = last_name
    else
      @first_name = name
      @last_name = last_name
      @middle_name = middle_name
    end
  end
end


binding.pry
