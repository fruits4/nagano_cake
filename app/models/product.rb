class Product < ApplicationRecord

	belongs_to :genre
	has_many :orderd_products, dependent: :destroy
	has_many :cart_items, dependent: :destroy
end
