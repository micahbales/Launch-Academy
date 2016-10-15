class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.belongs_to :camper

      t.timestamps
    end
  end
end
