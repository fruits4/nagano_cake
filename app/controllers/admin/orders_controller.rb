class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@orderd_products = @order.orderd_products
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
		@orderd_products = @order.orderd_products.all
		redirect_to admin_order_path(@order.id)
		if @order.status == "入金確認"
			@orderd_products.each do |orderd_product|
				orderd_product.update(status: :製作待ち)
			end
		else
			render :show
		end
	end

	private
	def orders_params
		params.require(:order).permit(:status)
	end



end