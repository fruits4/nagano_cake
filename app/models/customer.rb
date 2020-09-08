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

end
