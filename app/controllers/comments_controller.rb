class CommentsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]

  def create
    @comment = @book.comments.new(comment_params)
    if @comment.save
      redirect_to @book, notice: 'Comment successfully added!'
    else
      redirect_to @book, alert: 'Unable to add comment!'
    end
  end

  def destroy
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    redirect_to @book, notice: 'Comment deleted!'
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :note)
  end
end
