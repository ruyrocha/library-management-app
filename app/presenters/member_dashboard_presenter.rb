# frozen_string_literal: true

class MemberDashboardPresenter
  def initialize(member)
    @member = member
    @query = MemberDashboardQuery.new(user: member).call
  end

  def books
    @query[:books]
  end

  def overdue_books
    @query[:overdue_books]
  end
end
