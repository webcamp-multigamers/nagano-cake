class CartItem < ApplicationRecord
  validates :customer_id, presence: true
  validates :item_id, presence: true
end
