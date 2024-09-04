# frozen_string_literal: true

class BookComponent < ViewComponent::Base
  def initialize(book:)
    @book = book
  end
end
