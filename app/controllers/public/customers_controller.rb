class Public::CustomersController < ApplicationController
	before_action :authenticate_customer!

	def my_page
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
		@customer = current_customer
		if @customer.update(customer_params)
			redirect_to my_page_public_customers_path
		else
			flash[:danger] = 'お客様の情報を更新できませんでした。'
			render :edit
		end
	end

	def confirm
	end

	def withdraw
		@customer = current_customer
		@customer.update(is_deleted: true)
		reset_session
		redirect_to public_products_path
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :psot_code, :address, :email, :is_deleted, :phone_number)
	end

end
