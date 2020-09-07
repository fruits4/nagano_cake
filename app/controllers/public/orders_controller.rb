class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @shippings = current_customer.shippings
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orderd_products = @order.orderd_products
    @order_price = 0
    @orderd_products.each do |orderd_product|
      price = orderd_product.product.price * orderd_product.amount * 1.08
      @order_price += price
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    if params[:address_select] == "0"
       @order.post_code = current_customer.post_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:address_select] == "1"
       @shipping = current_customer.shippings.find(select_shipping_params[:select_shipping])
       @order.post_code = @shipping.post_code
       @order.address = @shipping.address
       @order.name = @shipping.name
    elsif params[:address_select] == "2"
       @order = current_customer.orders.new(order_params)
       @order.post_code = @order.post_code
       @order.address = @order.address
       @order.name = @order.name
    end
  end

  def create
      @order = Order.new(order_params)
      @order.customer = current_customer
      @cart_items = current_customer.cart_items
      if @order.save
        @cart_items.each do |cart_item|
          @orderd_product = @order.orderd_products.new
          @orderd_product.product_id = cart_item.product.id
          @orderd_product.amount = cart_item.amount
          @orderd_product.price = cart_item.product.price
          @orderd_product.save
        end
      end

      redirect_to complete_public_orders_path
  end

  def complete
  end

  private
  
  def order_params
  	params.require(:order).permit(:post_code, :address, :name, :payment, :total_price, :status, :customer_id)
  end

  def select_shipping_params
    params.require(:order).permit(:select_shipping)
  end
end
