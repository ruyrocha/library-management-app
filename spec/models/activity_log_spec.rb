# frozen_string_literal: true

require "rails_helper"

RSpec.describe(ActivityLog, type: :model) do
  it "allows user with member role to borrow the book if it is available" do
    user = create(:user)
    book = create(:book, total_copies: 1)

    activity_log = ActivityLog.new(user:, book:)

    expect(activity_log.save).to(be_truthy)
  end

  it "decreases book total copies by one on creation" do
    user = create(:user)
    book = create(:book, total_copies: 1)
    total_copies = book.total_copies

    ActivityLog.create!(user:, book:)
    book.reload

    expect(book.total_copies).to(eq(total_copies - 1))
  end

  it "does not allow user with member role to borrow the book if it is unavailable" do
    user = create(:user)
    book = create(:book, total_copies: 0)

    expect { ActivityLog.create!(user:, book:) }.to(raise_error(ActiveRecord::RecordInvalid))
  end

  it "does not allow user with member role to borrow the same book multiple times" do
    user = create(:user)
    book = create(:book, total_copies: 1)

    ActivityLog.create!(user:, book:)

    expect { ActivityLog.create!(user:, book:) }.to(raise_error(ActiveRecord::RecordInvalid))
  end

  it "tracks when a book was borrowed" do
    user = create(:user)
    book = create(:book, total_copies: 1)

    activity_log = ActivityLog.create!(user:, book:)

    expect(activity_log.borrowed_at).not_to(be_nil)
    expect(activity_log.borrowed_at).to(be_within(3.seconds).of(Time.current))
  end

  it "tracks when a book returning's date is due (2 weeks from the borrowing date)" do
    user = create(:user)
    book = create(:book, total_copies: 1)

    activity_log = ActivityLog.create!(user:, book:)

    expect(activity_log.due_at).not_to(be_nil)
    expect(activity_log.due_at).to(be_within(3.seconds).of(2.weeks.from_now))
  end

  it "allows user with librarian role to mark a book as returned"
  it "does not allow user with member role to mark book as returned"
end
