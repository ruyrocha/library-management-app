# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  include BooksManagementConcern

  # GET /books
  def index; end

  private

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :genre, :isbn, :total_copies)
  end
end
