class WingOrder < ActiveRecord::Base
  STATES = [
    ["Massachusetts", "MA"],
    ["New Hampshire", "NH"],
    ["Connecticut", "CT"],
    ["Maine", "ME"]
  ]

  QUANTITIES = [
    [10, "10 wings"],
    [25, "25 wings"],
    [50, "50 wings"],
    [100, "100 wings"]
  ]

  has_many :order_flavors
  has_many :flavors, through: :order_flavors

  validates :customer_name, presence: true
  validates :city, presence: true
  validates :state,
    presence: true,
    inclusion: { in: STATES.map { |state| state[1] } }
  validates :quantity,
    presence: true,
    numericality: { only_integer: true },
    inclusion: { in: QUANTITIES.map { |quantity| quantity[0] } }
  validates :ranch_dressing, inclusion: { in: [true, false] }
end
