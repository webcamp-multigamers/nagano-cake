class Order < ApplicationRecord
  validates :customer_id, presence: true
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum payment_integer: { 銀行振込: 0, クレジットカード: 1 }

  def address_all
    self.postal_code + self.address + self.first_name + self.last_name
  end
end
