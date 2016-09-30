class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { within: 1..255 }
  validates :artist, presence: true
  validates :artist, length: { within: 1..255 }
  validates :album, presence: true
  validates :artist, length: { within: 1..255 }
  validates :track_number, presence: true
  validates :year, presence: true
  validates :year, numericality: true, length: { within: 2..4 }

end
