class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :description
      t.integer :year
      t.belongs_to :genre, index: true, foreign_key: true
      t.belongs_to :format, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
