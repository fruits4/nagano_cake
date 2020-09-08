class Product < ApplicationRecord

	belongs_to :genre
	has_many :orderd_products, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	attachment :image, destroy: false

  def Product.search(search, product_or_customer)
  	if product_or_customer == '1'
    	Product.where('name LIKE ?', "%#{search}%")
  	end
  end

end
