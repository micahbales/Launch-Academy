class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :name, null: false
      table.text :description, null: false
      table.integer :deliciousness_rating, null: false

      table.timestamps null: false
    end
  end
end
