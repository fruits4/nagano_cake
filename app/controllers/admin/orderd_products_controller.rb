class Admin::OrderdProductsController < ApplicationController

	def update
		@order = Order.find(params[:id])
		@orderd_product = OrderdProduct.find(params[:id])
		@orderd_product.update(orderd_products_params)
		redirect_to admin_order_path(@order.id)
	end

	private
	def orderd_products_params
		params.require(:orderd_product).permit(:status)
	end


end
