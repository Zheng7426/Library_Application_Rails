class Api::UsersController < ApiController
  def index
    if !params[:email].nil?
      render json: User.where(email: params[:email])
    else
      render json: User.all
    end
  end

  def show
    render json: User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {error: 'User not found'}, status: 404
  end
end

