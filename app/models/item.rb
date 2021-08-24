class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  attachment :image
  validates  :name, :price, :genre_id, :introduction, :image, presence: true
  validates :is_sales_status, inclusion: {in: [true, false]}
# 税込価格表示のメソッド
   def taxin_price
     (price*1.1).round
   end

end
