class HomeController < ApplicationController
  skip_before_action :authenticate_customer!, only: [:splashpage]
  
  def splashpage
  	 render
  end

  def menu
  	@cart = ShoppingCart.create
  	session[:cart_id] = @cart.id
  	render
  end
end
