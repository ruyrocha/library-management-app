# frozen_string_literal: true

module Api
  module V1
    class BooksController < BaseController
      before_action :set_book, only: [:show, :edit, :update, :destroy]

      include BooksManagementConcern

      # GET /books
      def index
        @books = Book.all

        respond_with(@books)
      end

      def show
        respond_with(@book)
      end

      private

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:title, :author, :genre, :isbn, :total_copies)
      end
    end
  end
end
