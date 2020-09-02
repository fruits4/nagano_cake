class Public::CustomersController < ApplicationController
	def my_page
	end

	def edit
		@customer = Customer.find(params[:id])
	end

end
