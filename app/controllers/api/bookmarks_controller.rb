class Api::BookmarksController < ApiController
  # def index
  #   render json: User.all
  # end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: {user_id: params[:id], book_list: @user.favorites}
    else
      render json: {error: 'Bookmark not found'}, status: 404
    end
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book && current_api_user.favorites.exclude?(@book)
      current_api_user.favorites << @book
      render json: { message: 'book has been added' }
    else
      render json: { error: 'Book already in the list!' }
    end
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    if @book && current_api_user.favorites.include?(@book)
      current_api_user.favorites.delete(@book)
      render json: { message: 'book has been removed from the bookmark list.' }
    else
      render json: { error: 'Book not in the list!' }
    end
  end

end