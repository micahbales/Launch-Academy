class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.string :name, null: false
      t.string :publisher, null: false
      t.text :description
      t.date :release_date
      t.timestamps
    end
  end
end
