class Public::ProductsController < ApplicationController

	def index
		@genres = Genre.all
		@products = Product.all
	end

	def show
	end

	def top
		# @genres = Genre.all
		@genres = Genre.all
		@products = Product.where.not(status: "false").shuffle.take(4)
	end
end
