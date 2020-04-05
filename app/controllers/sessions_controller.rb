class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    password = params[:user][:password]

    # if user && user.authenticate(password)
    if user && password == user.password
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: 'Invalid username/password combination'
    end
  end


  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end
end