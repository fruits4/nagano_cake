class Shipping < ApplicationRecord

	belongs_to :customer

	def select_shipping
    	[post_code, address, name].join
  	end
end
