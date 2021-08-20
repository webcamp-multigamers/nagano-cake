class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy

  validates :first_name, length:{minimum: 1, maximum: 10}
  validates :last_name, length:{minimum: 1, maximum: 10}
  validates :first_name_kana, length:{minimum: 1, maximum: 10}
  validates :last_name_kana, length:{minimum: 1, maximum: 10}
  validates :email, length:{maximum: 100}
  validates :postal_code, length:{is: 7}, numericality: { only_integer: true }
  validates :address, length:{maximum: 100}
  validates :telephone_number, length:{is: 11}, numericality: { only_integer: true }




  #　値が”退会”ならログイン不可能になる処理
  def active_for_authentication?
    super && (self.is_secede_frag == false)
  end
  has_many :cart_items
end
