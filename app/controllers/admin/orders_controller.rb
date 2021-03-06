class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

	def index
		case params[:order_sort]
		when "0"
		 @orders = Order.where(created_at: Time.zone.today.all_day).order(created_at: "DESC").page(params[:page]).per(20)
		when "1"
		  @customer = Customer.find(params[:id])
		  @orders = @customer.orders.page(params[:page]).per(20)
		else
		  @orders = Order.all.page(params[:page]).per(20)
		end
		
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