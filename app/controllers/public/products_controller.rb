class Public::ProductsController < ApplicationController

	def index
		@genres = Genre.where.not(is_active: "false")
		@products = Product.where.not(status: "false").page(params[:page]).per(8)
		@pdcount = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
		@genres = Genre.where.not(is_active: "false")
	end

	def top
		# @genres = Genre.all
		@genres = Genre.all.where.not(is_active: "false")
		@products = Product.where.not(status: "false").shuffle.take(4)
	end
end
