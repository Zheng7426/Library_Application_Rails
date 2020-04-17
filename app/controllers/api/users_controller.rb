class Api::UsersController < ApiController
  def index
    render json: User.all
  end

  def show
    user = User.find_by(params[:id])
    if user
      render json: user
    else
      render json: { error: 'User not found' }, status: 404
    end
  end


end

