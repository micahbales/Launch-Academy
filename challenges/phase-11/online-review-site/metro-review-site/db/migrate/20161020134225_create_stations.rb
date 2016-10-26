class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.string :line, null: false
      t.string :state, null: false
      t.string :description
      t.boolean :parking, default: false

      t.timestamps
    end
  end
end
