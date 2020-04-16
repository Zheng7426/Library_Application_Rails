class Api::BooksController < ApiController
  def index
    render json: Book.all
  end

  def show
    book = Book.find_by(id: params[:id])
    if book
      render json: book, include: :comments
    else
      render json: { error: 'Book not found' }, status: 404
    end
  end

  def search
    render json: Book.where('title LIKE ?', "%#{params[:title]}%")
  end
end
