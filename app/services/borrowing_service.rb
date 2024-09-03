# frozen_string_literal: true

class BorrowingService
  def initialize(book:, user:)
    @activity_log = ActivityLog.new
    @activity_log.book = book
    @activity_log.user = user
  end

  def call = @activity_log.save!
end
