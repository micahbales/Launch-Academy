class Post < ApplicationRecord
  def self.list_all
    Post.order("created_at DESC")
  end
end
