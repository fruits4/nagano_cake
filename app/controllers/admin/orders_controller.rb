class Admin::OrdersController < ApplicationController

	@orders = Order.all

end
