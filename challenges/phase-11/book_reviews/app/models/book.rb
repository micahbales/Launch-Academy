class Book < ApplicationRecord
  validates :title, presence: true
  validates :published_at, presence: true
  validates :author, presence: true

  belongs_to :author
  has_many :reviews
end
