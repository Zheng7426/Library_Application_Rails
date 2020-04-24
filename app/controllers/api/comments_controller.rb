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


  def create
    @book = Book.find_by(id: params[:comment][:book_id])
    @comment = @book.comments.new(comment_api_params)
    if @comment.save
      render json: { notice: 'Comment successfully added!' }
    else
      render json: { notice: 'Comment not added!' }
    end
  end

  private
  def comment_api_params
    params.require(:comment).permit(:book_id, :title, :note)
  end

end

