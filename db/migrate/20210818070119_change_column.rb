class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :payment_integer, :integer
  end
end
