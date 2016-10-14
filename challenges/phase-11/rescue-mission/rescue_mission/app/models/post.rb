class Post < ApplicationRecord
  def self.list_all
    Post.order("created_at DESC")
  end

  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :title, length: { minimum: 40 }
  validates :description, presence: true
  validates :description, length: { minimum: 150 }
end
