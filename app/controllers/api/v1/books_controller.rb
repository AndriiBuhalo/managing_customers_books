# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApiController
      load_and_authorize_resource

      def create
        @book = current_customer.books.build(book_params)

        if @book.save
          render json: BookSerializer.new(@book).serializable_hash[:data][:attributes], status: :created
        else
          render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @book.destroy!
        render json: { message: 'Book deleted successfully' }, status: :ok
      end

      private

      def book_params
        params.require(:book).permit(:name, :title, :description)
      end
    end
  end
end
