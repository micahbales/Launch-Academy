class OrderFlavor < ActiveRecord::Base
  belongs_to :wing_order
  belongs_to :flavor

  validates :wing_order, presence: true
  validates :flavor, presence: true
end
