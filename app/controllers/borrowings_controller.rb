# frozen_string_literal: true

class BorrowingsController < ApplicationController
  before_action :load_book, only: :create

  def create
    if BorrowingService.new(book: @book, user: current_user).call
      respond_to do |format|
        format.html { redirect_to(@book, notice: "Book was successfully borrowed.") }
        format.json { render(json: @book, status: :created) }
        format.turbo_stream do
          render(turbo_stream: turbo_stream.replace("book", partial: "books/borrowed", locals: { book: @book }))
        end
      end
    else
      respond_to do |format|
        format.html { render(:new) }
        format.json { render(json: @book.errors, status: :unprocessable_entity) }
        format.turbo_stream do
          render(turbo_stream: turbo_stream.replace("book", partial: "books/form", locals: { book: @book }))
        end
      end
    end
  end

  private

  def load_book
    @book = Book.find(permitted_params[:book_id])
  end

  def permitted_params
    params.permit(:book_id)
  end
end
