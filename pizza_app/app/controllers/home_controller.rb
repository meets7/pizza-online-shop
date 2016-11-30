class HomeController < ApplicationController
  skip_before_action :authenticate_customer!, only: [:splashpage]
  
  def splashpage
  	 render
  end

  def menu
  	if !session.has_key?("cart_id") 
  		@cart = ShoppingCart.create
  		session[:cart_id] = @cart.id
  	end
  	render
  end
end
