class Public::OrdersController < ApplicationController

  def new
  	@payment = Order.new
  end

  def index
  end

  def show
  end

  private
  def order_params
  	params.require(:order).permit(:payment)
  end
end
