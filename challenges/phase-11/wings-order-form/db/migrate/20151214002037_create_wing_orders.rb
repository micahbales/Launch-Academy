class CreateWingOrders < ActiveRecord::Migration
  def change
    create_table :wing_orders do |t|
      t.string :customer_name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :quantity, null: false
      t.boolean :ranch_dressing, null: false, default: false
    end
  end
end
