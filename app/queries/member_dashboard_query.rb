# frozen_string_literal: true

class MemberDashboardQuery
  def initialize(user:)
    @user = user
  end

  def call
    {
      books: ActivityLog.joins(:book).where(user: @user),
      overdue_books: ActivityLog.joins(:book).where(user: @user, due_at: ..Date.today, returned_at: nil),
    }
  end
end
