class Camper < ActiveRecord::Base
  belongs_to :campsite
  has_many :supplies
end
