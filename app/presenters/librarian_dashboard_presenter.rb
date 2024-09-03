# frozen_string_literal: true

class LibrarianDashboardPresenter
  def initialize(query = LibrarianDashboardQuery.call)
    @query = query
  end

  def total_books
    @query[:total_books]
  end

  def total_borrowed_books
    @query[:total_borrowed_books]
  end

  def books_due_today
    @query[:books_due_today]
  end

  def members_with_overdue_books
    @query[:members_with_overdue_books]
  end
end
