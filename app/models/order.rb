class Order < ApplicationRecord

	belongs_to :customer
	has_many :orderd_products, dependent: :destroy

	enum payment: {クレジットカード: 1, 銀行振り込み: 2}
	enum status: {
		入金待ち: 0,
		入金確認: 1,
		製作中: 2,
		発送準備中: 3,
		発送済み: 4
	}

	def select_shipping
    	[post_code, address, name].join
  	end

  	def total_amount
		amount = 0
        orderd_products.each do |orderd_product|
        	amount += orderd_product.amount
        end
        return amount
	end


end
