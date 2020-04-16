class UsersController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: login_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :employee_number)
  end
end
