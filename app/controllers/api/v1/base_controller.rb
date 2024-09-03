# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      http_basic_authenticate_with name: ENV["API_AUTH_USERNAME"],
        password: ENV["API_AUTH_PASSWORD"],
        if: :api_request?

      skip_before_action :authenticate_user!

      protect_from_forgery with: :null_session

      rescue_from ActiveRecord::RecordNotFound do |_|
        respond_to do |format|
          format.json { head :not_found }
        end
      end

      respond_to :json
    end
  end
end
