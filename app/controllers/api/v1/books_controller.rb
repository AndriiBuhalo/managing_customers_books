class Api::V1::BooksController < ApiController
  load_and_authorize_resource

  def create
    @book = current_customer.books.build(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    render json: { message: 'Book deleted successfully' }, status: :ok
  end

  private

  def book_params
    params.require(:book).permit(:name, :title, :description)
  end
end
