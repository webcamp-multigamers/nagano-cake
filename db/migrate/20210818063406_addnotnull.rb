class Addnotnull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :admins, :reset_password_token, false
    change_column_null :admins, :reset_password_sent_at, false
    change_column_null :admins, :remember_created_at, false
    change_column_null :cart_items, :quantity, false
    change_column_null :customers, :reset_password_token, false
    change_column_null :customers, :reset_password_sent_at, false
    change_column_null :customers, :remember_created_at, false
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :postal_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :telephone_number, false
    change_column_null :genres, :name, false
    change_column_null :items, :genre_id, false
    change_column_null :items, :name, false
    change_column_null :items, :introduction, false
    change_column_null :items, :image_id, false
    change_column_null :items, :price, false
    change_column_null :items, :is_sales_status, false
    change_column_null :orders, :address, false
    change_column_null :orders, :postal_code, false
    change_column_null :orders, :name, false
    change_column_null :orders, :postage, false
    change_column_null :orders, :total_price, false
    change_column_null :orders, :order_status, false
    change_column_null :orders, :payment_integer, false
  end
end
