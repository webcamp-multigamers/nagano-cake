class Address < ApplicationRecord
  belongs_to :customer
  validates :customer_id, presence: true
  validates :postal_code, length:{is: 7}, numericality: { only_integer: true }
  validates :address, length:{minimum: 1, maximum: 100}
  validates :name, length:{minimum: 2, maximum: 20}

  def select_address
    self.postal_code + self.address + self.name
  end
end
