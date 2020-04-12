class SessionsController < ApplicationController
  skip_before_action :ensure_login, :check_internal, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    password = params[:user][:password]

    # if user && user.authenticate(password)
    if user && (password == user.password) && (user.employee_number == nil)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    elsif user.employee_number != nil
      session[:user_id] = user.id
      session[:employee_number] = user.employee_number
      redirect_to internal_path, notice: 'Logged in as Employee successfully'
    else
      redirect_to login_path, alert: 'Invalid username/password combination'
    end
  end


  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end
end
