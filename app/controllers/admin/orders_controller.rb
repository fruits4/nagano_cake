class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

	def index
		path = Rails.application.routes.recognize_path(request.referer)
		
		if path[:controller] == "admin/top" && path[:action] == "top"
			@orders = Order.where("created_at >= ?", Date.today).all
		elsif path[:controller] == "admin/customers" && path[:action] == "show"
			@orders = Order.where(customer_id: path[:id])
		else
			@orders = Order.all
		end
		@orders = @orders.page(params[:page]).per(20)
	end

	def show
		@order = Order.find(params[:id])
		@orderd_products = @order.orderd_products
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
		@orderd_products = @order.orderd_products
		redirect_to admin_order_path(@order.id)
		if @order.status == "入金確認"
			@orderd_products.each do |orderd_product|
				orderd_product.update(status: "製作待ち")
			end
		end
	end

	private
	def orders_params
		params.require(:order).permit(:status)
	end



end