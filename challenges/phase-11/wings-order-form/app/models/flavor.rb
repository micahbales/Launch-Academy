class Flavor < ActiveRecord::Base
  has_many :order_flavors
  has_many :wing_orders, through: :order_flavors

  validates :name, presence: true
end
