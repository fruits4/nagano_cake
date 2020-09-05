class Order < ApplicationRecord

	belongs_to :customer
	has_many :orderd_products, dependent: :destroy

	enum payment: {クレジットカード:1, 銀行振り込み:2}

	def select_shipping
    	[post_code, address, name].join
  	end

end
