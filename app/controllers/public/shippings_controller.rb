class Public::ShippingsController < ApplicationController

  before_action :authenticate_customer!

    #配送先一覧
  def index
    	@shippings = current_customer.shippings
        @shipping = Shipping.new
  end
   #配送先新規保存
  def create
  	@shipping = Shipping.new(shipping_params)
  	@shipping.customer = current_customer
  	@shipping.save
  	redirect_to public_shippings_path
  end
   #配送先編集
  def edit
  	@shipping = Shipping.find(params[:id])
  end
   #編集内容保存
  def update
  	@shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
      redirect_to public_shippings_path(@shipping)
  end
    #配送先削除
  def destroy
  	@shipping = Shipping.find(params[:id])
  	@shipping.destroy
  	redirect_to public_shippings_path

  end

 private
    def shipping_params
        params.require(:shipping).permit(:post_code, :address, :name)
    end
end
