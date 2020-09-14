class Admin::OrderdProductsController < ApplicationController

before_action :authenticate_admin!

	def update
		@order = Order.find(params[:id])
		@orderd_product = OrderdProduct.find(params[:fruit])
		@orderd_product.update(orderd_products_params)
		@orderd_products = @order.orderd_products

		if @orderd_products.find_by(status: "製作中")
			@order.update(status: "製作中")
			redirect_to admin_order_path(@order)

		else
			@done = 0
			@orderd_products.each do |orderd_product|
				if orderd_product.status == "製作完了"
				@done += 1
				end
			end

			if @orderd_products.count == @done
				@order.update(status: "発送準備中")
				redirect_to admin_order_path(@order)
			end
		end
	end

	private
	def orderd_products_params
		params.require(:orderd_product).permit(:status)
	end


end
