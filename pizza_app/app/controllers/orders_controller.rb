class OrdersController < ApplicationController

	def index
		@orders = Order.where(:customer_id => current_customer.id)
	end

	def new
		@cart = ShoppingCart.find(session[:cart_id])
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		@item = Item.find(params[:item_id])

		quantity = 1
		for cartitem in @cartitems
			if cartitem.item_id == @item.id
				quantity = cartitem.quantity + 1
				@cart.remove(cartitem, cartitem.quantity)
			end 	
		end
		@cart.add(@item,@item.price, quantity)
		redirect_to pizzas_path
	end

	def create
		@order = Order.create(:customer_id => current_customer.id, :date => DateTime.now)
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		totalPrice = 0
		for item in @cartitems
			itemPrice = item.quantity * item.price_cents / 100
			totalPrice += itemPrice
			@order_item =  OrderItem.create(:order_id => @order.id, :item_id => item.id)
		end
		@order.price = totalPrice
		@order.save
		@cart = ShoppingCart.create
  		session[:cart_id] = @cart.id
		render 'thankyou'
	end

	def checkout
		@cartitems = ShoppingCartItem.where(owner_id: session[:cart_id])
		@checkoutitems = []
		@totalPrice = 0.0
		for cartItem in @cartitems
			itemPrice = cartItem.quantity * cartItem.price_cents / 100
			@totalPrice += itemPrice
			checkoutItem = Item.find(cartItem.item_id)
			@checkoutitems.push checkoutItem
		end
	end

end
