class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :board_game_collections
  has_many :board_games, through: :board_game_collections

  validates :email, uniqueness: true
  validates :role, inclusion: { in: ['user', 'admin'] }

  def is_admin?
    role == 'admin'
  end
end
