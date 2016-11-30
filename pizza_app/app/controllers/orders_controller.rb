class OrdersController < ApplicationController

	def index
		@orders = Order.where(:customer_id => current_customer.id)
	end

	def new
		@cart = ShoppingCart.find(session[:cart_id])
		@item = Item.find(params[:item_id])
		@cart.add(@item,@item.price)
		redirect_to pizzas_path
	end

	def create
		@order = Order.create(:customer_id => current_customer.id, :date => DateTime.now)
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		for item in @cartitems
			@order_item =  OrderItem.create(:order_id => @order.id, :item_id => item.id)
		end
		@cart = ShoppingCart.create
  		session[:cart_id] = @cart.id
		render 'thankyou'
	end

	def checkout
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		@checkoutitems = []
		for cartItem in @cartitems
			checkoutItem = Item.find(cartItem.item_id)
			@checkoutitems.push checkoutItem
		end
	end

end
