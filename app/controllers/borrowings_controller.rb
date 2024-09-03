# frozen_string_literal: true

class BorrowingsController < ApplicationController
  before_action :load_book, only: :create

  def create
    BorrowingService.new(book: @book, user: current_user).call
  end

  private

  def load_book
    @book = Book.find(permitted_params[:book_id])
  end

  def permitted_params
    params.permit(:book_id)
  end
end