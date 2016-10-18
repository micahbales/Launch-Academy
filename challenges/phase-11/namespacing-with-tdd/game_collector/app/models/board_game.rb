class BoardGame < ActiveRecord::Base
  has_many :board_game_collections
  has_many :users, through: :board_game_collections

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :publisher, presence: true

  validates :min_players, numericality: { greater_than: 0 }
  validates :max_players, numericality: { greater_than: 0 }
end
