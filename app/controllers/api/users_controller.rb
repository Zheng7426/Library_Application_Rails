class Api::UsersController < ApiController
  def index
    if !params[:email].nil?
      render json: User.where(email: params[:email])
    else
      render json: User.all
    end
  end

  def show
    if !params[:id].nil?
      render json: User.find(params[:id])
    else
      render json: {error: 'User not found'}, status: 404
    end
  end
end

