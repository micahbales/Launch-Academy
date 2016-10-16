class Format < ActiveRecord::Base
  has_many :videos

  validates :name, presence: true
  validates :name, uniqueness: true
end
