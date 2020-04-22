class Api::BookmarksController < ApiController
  # def index
  #   render json: User.all
  # end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user.favorites
    else
      render json: { error: 'Bookmark not found' }, status: 404
    end
  end


end