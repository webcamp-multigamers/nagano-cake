class RenamePaymentIntegerColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :payment_integer, :payment
  end
end
