class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@orderd_products = @order.orderd_products
	end

end
