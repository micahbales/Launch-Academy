class Meetup < ActiveRecord::Base
  validates :description, presence: true
  validates :title, presence: true
  validates :location, presence: true

  has_many :users, through: :meetup_users
  has_many :meetup_users
end
