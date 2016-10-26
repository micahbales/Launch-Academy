class Review < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :station_id, presence: true

  belongs_to :station, optional: true
  has_many :votes, dependent: :destroy

  def vote_total
    total = 0
    votes.each do |vote|
      total += vote.value
    end
    total
  end
end
