class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true

  def sum_price
    item.taxin_price * quantity
  end
end
