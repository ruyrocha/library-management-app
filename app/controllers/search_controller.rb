# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @books = if search_params[:query]
      BooksSearchQuery.new(search_params).call
    end
  end

  private

  def search_params
    params.permit(:query)
  end
end
