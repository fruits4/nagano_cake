class Public::CartItemsController < ApplicationController


  def index
  	@cart_items = current_customer.cart_items
  end

  def create
  	@cart_item = current_customer.cart_items.new(cart_item_params)
      if @now_cart_item = current_customer.cart_items.find_by(product_id: @cart_item.product_id)
         @now_cart_item.amount += @cart_item.amount
         @now_cart_item.update(amount: @now_cart_item.amount)
         @cart_item.destroy
      end
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:amount, :customer_id, :product_id)
  end
end
