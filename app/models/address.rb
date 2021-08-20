class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, length:{is: 7}, numericality: { only_integer: true }
  validates :address, length:{minimum: 1, maximum: 100}
  validates :name, length:{minimum: 2, maximum: 20}
end
