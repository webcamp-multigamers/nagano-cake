class ChangeIsSecedeFragDefaultToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :is_secede_frag, from: nil, to: false
  end
end
