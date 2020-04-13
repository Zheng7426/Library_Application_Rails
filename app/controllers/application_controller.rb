class ApplicationController < ActionController::Base
  # before_action :ensure_login
  before_action :authenticate_user!
  helper_method :logged_in?, :current_user, :logged_in_as_employee?

  protected
  # def ensure_login
  #   redirect_to login_path unless session[:employee_number] || session[:user_id]
  # end

  def check_internal
    redirect_to internal_path if session[:employee_number]
  end

  def logged_in?
    session[:user_id]
  end

  def logged_in_as_employee?
    session[:employee_number]
  end


  # def current_user
  #   @current_user = User.find_by_id(session[:user_id])
  #   #unless @current_user
  #   #  redirect_to logout_url and return
  #   #end
  # end
end
