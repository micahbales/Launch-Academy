class Recipe < ActiveRecord::Base
  has_many :comments
  def comments
    Comment.where(recipe_id: id)
  end
  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /brussels sprouts/i,
    message: "only allows entries with 'brussels sprouts' in the title" }
  validates :serving, uniqueness: false
  validates :serving, numericality: { greater_than_or_equal_to: 1 }, :allow_blank => true
end
