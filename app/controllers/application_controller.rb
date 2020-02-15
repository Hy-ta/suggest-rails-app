class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

  def configure_permitted_parameters
    # add name strong parameter when signup
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    # add name & email img strong parameter when user editting account
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :img])
  end
end
