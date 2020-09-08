class Admin::SearchController < ApplicationController
	def search
		@product_or_customer = params[:model]
		if @product_or_customer == '1'
			@products = Product.search(params[:search], @product_or_customer)
		else
			@customers = Customer.search(params[:search], @product_or_customer)
		end
	end
end
