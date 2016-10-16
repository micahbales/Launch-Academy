class Comment < ActiveRecord::Base
  belongs_to :video

  validates :title, presence: true
  validates :content, presence: true
  validates :video, presence: true
end
