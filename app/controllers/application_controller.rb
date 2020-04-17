class ApplicationController < ActionController::Base
  # before_action :ensure_login

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  #helper_method
  # protect_from_forgery with: :null_session

  protected
  # def ensure_login
  #   redirect_to login_path unless session[:employee_number] || session[:user_id]
  # end

  # def check_internal
  #   redirect_to internal_path if session[:employee_number]
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

end
