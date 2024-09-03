# frozen_string_literal: true

class BorrowingService
  def initialize(book:, user:)
    @inventory = Inventory.new
    @inventory.book = book
    @inventory.user = user
  end

  def call = @inventory.save!
end

