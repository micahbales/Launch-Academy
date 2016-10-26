class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :station_id, null: false

      t.timestamps
    end
  end
end
