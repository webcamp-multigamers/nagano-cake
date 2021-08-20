class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, length:{is: 7}, numericality: { only_integer: true }
  validates :address, length:{maximum: 100}
  validates :name, length:{maximum: 20}
end
