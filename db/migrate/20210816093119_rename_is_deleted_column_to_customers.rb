class RenameIsDeletedColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :is_deleted, :is_secede_frag
  end
end
