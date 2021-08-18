class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :address
      t.string :postal_code
      t.string :name
      t.integer :postage, default: 800
      t.integer :total_price
      t.integer :order_status, default: 0
      t.string :payment_integer, default: 0

      t.timestamps
    end
    add_foreign_key :orders, :customers
  end
end
