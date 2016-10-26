class Vote < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
