class Public::ProductsController < ApplicationController

	def index
		@genres = Genre.all.where.not(is_active: "false")
		@products = Product.all
	end

	def show
	end

	def top
		# @genres = Genre.all
		@genres = Genre.all.where.not(is_active: "false")
		@products = Product.where.not(status: "false").shuffle.take(4)
	end
end
