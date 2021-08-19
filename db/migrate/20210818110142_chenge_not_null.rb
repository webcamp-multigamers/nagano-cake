class ChengeNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :reset_password_token, true
    change_column_null :customers, :reset_password_sent_at, true
    change_column_null :customers, :remember_created_at, true
    change_column_null :customers, :last_name, true
    change_column_null :customers, :first_name, true
    change_column_null :customers, :last_name_kana, true
    change_column_null :customers, :first_name_kana, true
    change_column_null :customers, :postal_code, true
    change_column_null :customers, :address, true
    change_column_null :customers, :telephone_number, true
    change_column_null :admins, :reset_password_token, true
    change_column_null :admins, :reset_password_sent_at, true
    change_column_null :admins, :remember_created_at, true
  end
end
