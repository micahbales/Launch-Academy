class Station < ApplicationRecord
  validates :name, presence: true
  validates :line, presence: true
  validates :state, presence: true

  has_many :reviews, dependent: :destroy
end
