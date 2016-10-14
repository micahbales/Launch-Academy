class Comment < ApplicationRecord
  def self.list_all
    Comment.order("created_at ASC")
  end

  belongs_to :post
  validates :description, presence: true
  validates :description, length: { minimum: 50 }
end
