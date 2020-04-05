class ApplicationController < ActionController::Base
  before_action :ensure_login
  helper_method :logged_in?, :current_user, :logged_in_as_employee?, :current_employee

  protected
  def ensure_login
    redirect_to login_path unless session[:employee_number] || session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end

  def logged_in_as_employee?
    session[:employee_number]
  end

  def current_employee
    @current_employee = User.find_by employee_number: session[:employee_number]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
