class OrderdProduct < ApplicationRecord

	belongs_to :product
	belongs_to :order

	enum status: {
		製作不可: 0, #製作不可
		製作待ち: 1, #製作待ち
		製作中: 2, #製作中
		製作完了: 3 #製作完了
	}
end
