class CreateOrderFlavors < ActiveRecord::Migration
  def change
    create_table :order_flavors do |t|
      t.integer :wing_order_id, null: false
      t.integer :flavor_id, null: false
    end
  end
end
