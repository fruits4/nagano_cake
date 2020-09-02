class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
  end

  def complete
  end

  private
  def order_params
  	params.require(:order).permit(:post_code, :address, :name, :shpping_cost, :total_price, :status, :payment)
  end
end
