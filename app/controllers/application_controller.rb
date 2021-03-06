class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
 
    def after_sign_in_path_for(resources)
      user_path(@user)
    end 

    protected

  def configure_permitted_parameters
    # add name strong parameter when signup
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :char_id])
    # add name & email img strong parameter when user editting account
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :img])
  end
end
