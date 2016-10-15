class CreateCampers < ActiveRecord::Migration
  def change
    create_table :campers do |t|
      t.string :name, null: false
      t.belongs_to :campsite

      t.timestamps
    end
  end
end
