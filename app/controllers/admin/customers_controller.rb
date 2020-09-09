class Admin::CustomersController < ApplicationController

before_action :authenticate_admin!

def index
  @customers = Customer.all
end

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to admin_products_path
end

private
  def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_deleted)
  end
end