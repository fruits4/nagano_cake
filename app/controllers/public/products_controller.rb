class Public::ProductsController < ApplicationController

	def index
		@genres = Genre.all.where.not(is_active: "false")
		@products = Product.all.page(params[:page]).per(8)
	end

	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end

	def top
		# @genres = Genre.all
		@genres = Genre.all.where.not(is_active: "false")
		@products = Product.where.not(status: "false").shuffle.take(4)
	end
end
