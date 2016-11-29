class OrdersController < ApplicationController

	def new
		@cart = ShoppingCart.find(session[:cart_id])
		@item = Item.find(params[:item_id])
		@cart.add(@item,@item.price)
		redirect_to pizzas_path
	end

	def create
		@order = Order.create
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		for item in @cartitems
			@order
		end
	end

end
