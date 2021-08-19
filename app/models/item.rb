class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  attachment :image
  validates  :name, :price, :genre_id, :introduction, presence: true

   validates :is_sales_status, inclusion: {in: [true, false]}
end
