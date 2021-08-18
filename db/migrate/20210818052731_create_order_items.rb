class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :order_quantity, null: false
      t.integer :create_status, default: 0, null: false
      t.integer :price, null: false

      t.timestamps
    end
    add_foreign_key :order_items, :items
    add_foreign_key :order_items, :orders
  end
end
