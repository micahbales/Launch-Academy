class AddUniquenessIndexToBoardGames < ActiveRecord::Migration
  def change
    add_index :board_games, :name, unique: true
  end
end
