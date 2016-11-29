class HomeController < ApplicationController
  skip_before_action :authenticate_customer!, only: [:splashpage]
  
  def splashpage
  	 render
  end

  def menu
  	 render
  end
end
