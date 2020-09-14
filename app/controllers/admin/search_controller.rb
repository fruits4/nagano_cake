class Admin::SearchController < ApplicationController

	before_action :authenticate_admin!
	
	def search
		@product_or_customer = params[:model]
		if params[:search] == ''
			flash[:search] = '※検索したいキーワードを入力してください※'
			redirect_to request.referer
		else
			if @product_or_customer == '1'
				@products = Product.search(params[:search], @product_or_customer)
			else
				@customers = Customer.search(params[:search], @product_or_customer)
			end
		end
	end
end
