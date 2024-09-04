# frozen_string_literal: true

class LibrarianDashboardQuery
  class << self
    def call = new.call
  end

  def call
    {
      total_books: total_books,
      total_borrowed_books: total_borrowed_books,
      books_due_today: books_due_today,
      members_with_overdue_books: members_with_overdue_books,
    }
  end

  private

  def total_books = Book.count

  def users_table = User.arel_table

  def activity_logs_table = ActivityLog.arel_table

  def today = Date.today

  # TODO: clean up, playing too much with Arel
  def total_borrowed_books
    # Build the condition for returned_at being NULL
    returned_at_condition = activity_logs_table[:returned_at].eq(nil)

    # Build the query to count the records
    count_query = activity_logs_table
      .project(Arel.sql("COUNT(*)"))
      .where(returned_at_condition)

    # Execute the query
    ActivityLog.connection.execute(count_query.to_sql)&.first&.[]("count")&.to_i
  end

  def books_due_today
    ActivityLog.where(due_at: today, returned_at: nil).count
  end

  def members_with_overdue_books
    # Join condition
    join_condition = users_table.join(activity_logs_table)
      .on(users_table[:id].eq(activity_logs_table[:user_id]))
      .join_sources

    # Conditions
    due_date_condition = activity_logs_table[:due_at].lt(today)
    returned_at_condition = activity_logs_table[:returned_at].eq(nil)
    conditions = due_date_condition.and(returned_at_condition)

    # Convert Arel query to SQL and execute
    User.joins(join_condition).where(conditions).distinct
  end
end
