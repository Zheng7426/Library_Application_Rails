class Api::CommentsController < ApiController
  #before_action :set_book

  # def index
  #   render json: Book.all
  # end

  def show
    #@comment = @book.comments.find(params[:id])
    @book = Book.find_by(id: params[:id])
    if @book
      render json: @book.comments
    else
      render json: { error: 'Comment not found' }, status: 404
    end
  end

  # private
  # def set_book
  #   @book = Book.find(params[:book_id])
  # end

end

