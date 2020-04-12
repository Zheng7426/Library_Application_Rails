class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  skip_before_action :check_internal

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    password = params[:user][:password]

    # if user && user.authenticate(password)
    if user && (password == user.password)
      if (user.employee_number != nil)&&!(user.employee_number.blank?)
        session[:user_id] = user.id
        session[:employee_number] = user.employee_number
        redirect_to internal_path, notice: 'Logged in as Employee successfully'
      else
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      end
    else
      redirect_to login_path, alert: 'Invalid username/password combination'
    end
  end


  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end
end
