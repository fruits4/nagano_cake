class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def Customer.search(search, product_or_customer)
  	if product_or_customer == '2'
    	Customer.where('last_name LIKE ?', "%#{search}%")
  	end
  end

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :post_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 10..11 }

end
