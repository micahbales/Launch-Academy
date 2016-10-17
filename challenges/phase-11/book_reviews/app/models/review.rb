class Review < ApplicationRecord
  validates :rating, presence: true
  validates :body, presence: true
  validates :book, presence: true 
  validates :user, presence: true

  belongs_to :book
  belongs_to :user
end
