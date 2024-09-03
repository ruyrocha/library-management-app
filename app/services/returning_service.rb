# frozen_string_literal: true

class ReturningService
  NotPermittedError = Class.new(StandardError)

  def initialize(book:, user:)
    @user = user
    @book = book
  end

  def call
    raise NotPermittedError unless @user.is_librarian?

    # # TODO: it's weird, needs fixiing.
    # @inventory.update!(returned_at: Time.current)

    @book.update!(total_copies: @book.total_copies + 1)
  end
end
