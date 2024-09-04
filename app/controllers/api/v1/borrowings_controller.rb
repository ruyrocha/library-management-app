# frozen_string_literal: true

module Api
  module V1
    class BorrowingsController < BaseController
      include ::BooksBorrowingConcern

      before_action :load_book, only: :create

      rescue_from ActiveRecord::RecordInvalid do |exception|
        respond_to do |format|
          format.json { head :not_acceptable }
        end
      end

      private

      def permitted_params = params.permit(:book_id, :user_id)

      def borrowing_service
        user = User.find_by!(id: permitted_params[:user_id])

        BorrowingService.new(book: @book, user: user)
      end
    end
  end
end
