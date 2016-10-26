class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :value, presence: true, inclusion: { in: -1..1 }
  belongs_to :user
  belongs_to :review

end
