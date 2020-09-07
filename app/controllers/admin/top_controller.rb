class Admin::TopController < ApplicationController

	@orders = Order.where("created_at >= ?", Date.today)

end
