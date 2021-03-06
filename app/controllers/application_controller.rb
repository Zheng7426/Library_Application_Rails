class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :check_internal
  #helper_method
  # protect_from_forgery with: :null_session
  #

  def check_internal
    redirect_to internal_path if current_user.employee_role
  end

  protected
  # def ensure_login
  #   redirect_to login_path unless session[:employee_number] || session[:user_id]
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

end
