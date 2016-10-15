class Campsite < ActiveRecord::Base
  has_many :campers
end
