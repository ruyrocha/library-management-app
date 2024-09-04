# frozen_string_literal: true

class BorrowingsController < ApplicationController
  include BooksBorrowingConcern

  before_action :load_book, only: :create

  private

  def permitted_params = params.permit(:book_id)

  def borrowing_service = BorrowingService.new(book: @book, user: current_user)
end
