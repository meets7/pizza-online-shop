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
			@order_item =  OrderOrderItem.create
			@order_item.order_id = @order.order_id
			@order_item.item_id = item.id
			@order_item.save
		end
	end

	def checkout
		p 
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		@checkoutitems = []
		for cartItem in @cartitems
			checkoutItem = Item.find(cartItem.item_id)
			@checkoutitems.push checkoutItem
		end
		render
	end

end
