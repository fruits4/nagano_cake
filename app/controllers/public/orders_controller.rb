class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def index
    
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.save
    redirect_to public_order_confirm_path(current_customer)
  end

  def confirm
    @orders = Order.all
  end

  def complete
  end

  private
  
  def order_params
  	params.require(:order).permit(:post_code, :address, :name, :shpping_cost, :total_price, :status, :payment)
  end
end
