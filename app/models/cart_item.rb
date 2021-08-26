class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, :item_id, :quantity, presence: true

# カート一覧で合計金額を出すためのメソッドです
  def sum_price
    item.taxin_price * quantity
  end
end
