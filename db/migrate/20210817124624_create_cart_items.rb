class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity

      t.timestamps
    end
    add_foreign_key :cart_items, :customers
    add_foreign_key :cart_items, :items
  end
end
