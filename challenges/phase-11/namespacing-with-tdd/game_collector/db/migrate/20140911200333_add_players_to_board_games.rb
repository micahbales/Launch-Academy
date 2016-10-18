class AddPlayersToBoardGames < ActiveRecord::Migration
  def change
    add_column :board_games, :min_players, :integer
    add_column :board_games, :max_players, :integer
  end
end
