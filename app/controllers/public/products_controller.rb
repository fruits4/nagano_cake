class Public::ProductsController < ApplicationController

	def index
	end

	def show
	end

	def top
		@genres = Genre.all
		@products = Product.all
	end
end
