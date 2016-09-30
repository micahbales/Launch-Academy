class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.integer :recipe_id, null: false
      table.text :body, null: false

      table.timestamps null: false
    end
  end
end
