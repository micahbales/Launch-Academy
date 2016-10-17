class User < ApplicationRecord
  
  def recent_reviews
   reviews.order(created_at: :desc)
  end

  has_many :reviews
end
