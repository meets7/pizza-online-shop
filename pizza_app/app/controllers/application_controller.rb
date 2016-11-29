class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_customer!, :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(customer)
    home_menu_path
  end

  def after_sign_out_path_for(customer)
    home_splashpage_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :address, :name])
  end

end
