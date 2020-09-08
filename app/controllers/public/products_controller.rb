class Public::ProductsController < ApplicationController

	def index
		@genres = Genre.where.not(is_active: "false")

		if params[:para].present?
			@products = Product.where(genre_id: params[:para], status: "true").page(params[:page]).per(8)
			@genre = @products.first.genre
		else
			@products = Product.where.not(status: "false").page(params[:page]).per(8)
			@pdcount = Product.all
		end
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

	# def search
	# 	@products = Product.search(params[:search])
	# end
end
