class CreateComment < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :description, null: false
      t.integer :post_id

      t.timestamps
    end
  end
end
