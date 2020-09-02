class Order < ApplicationRecord

	enum payment: [:cregit, :bank]

end
