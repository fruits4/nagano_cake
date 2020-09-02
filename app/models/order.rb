class Order < ApplicationRecord

	belongs_to :customer
	has_many :orderd_products, dependent: :destroy

end
