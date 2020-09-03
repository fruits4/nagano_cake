class Public::OrdersController < ApplicationController



  def new
    @order = Order.new
    @shippings = current_customer.shippings
  end

  def index
    
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    if params[:address_select] == "customer_address"
       @order = current_customer.post_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
       @order.save
    elsif params[:address_select] == "deliverey_address"
       @shipping = Shipping.find(params[:select_shipping][:id])
       @order.post_code = @shipping.post_code
       @order.address = @shipping.address
       @order.name = @shipping.name
       @order.save
    elsif params[:address_select] == "new_address"
       @order = Order.find(params)
       @order.save
    end

    render 'new'

  end

  def create
      @order = Order.new(order_params)
      @order.customer = current_customer
      @order.save
      redirect_to public_order_confirm_path(current_customer)
  end

  def complete
  end

  private
  
  def order_params
  	params.require(:order).permit(:post_code, :address, :name)
  end

  
end
