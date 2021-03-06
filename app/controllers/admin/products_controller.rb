class Admin::ProductsController < ApplicationController

    before_action :authenticate_admin!

	def index
		@products = Product.all.page(params[:page]).per(10)
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@genres = Genre.all
	end

	def edit
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path(@product)
		else
			render "new"
		end
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to admin_products_path(@product)
	end

private

    def product_params
	    params.require(:product).permit(:name, :image, :explain, :status, :price, :genre_id)
    end
end
