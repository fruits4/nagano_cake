class Shipping < ApplicationRecord

	belongs_to :customer

	validates :address, presence: true
	validates :post_code, presence: true
	validates :name, presence: true

	def select_shipping
    	[post_code, address, name].join
  	end
end
