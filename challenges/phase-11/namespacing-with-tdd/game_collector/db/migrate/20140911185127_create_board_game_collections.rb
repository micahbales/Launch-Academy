class CreateBoardGameCollections < ActiveRecord::Migration
  def change
    create_table :board_game_collections do |t|
      t.integer :user_id, null: false
      t.integer :board_game_id, null: false
      t.date :purchased
      t.timestamps
    end
  end
end
