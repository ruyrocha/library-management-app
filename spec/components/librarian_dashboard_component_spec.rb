# frozen_string_literal: true

require "rails_helper"

RSpec.describe(LibrarianDashboardComponent, type: :component) do
  def members_with_overdue_books
    [
      double(email: FFaker::Internet.email),
      double(email: FFaker::Internet.email),
      double(email: FFaker::Internet.email),
    ]
  end

  def presenter
    double(
      total_books: 120,
      total_borrowed_books: 45,
      books_due_today: 5,
      members_with_overdue_books: members_with_overdue_books,
    )
  end

  it "displays the total number of books" do
    render_inline(described_class.new(presenter: presenter))

    expect(page).to(have_selector(".text-blue-600", text: "Total Books"))
    expect(page).to(have_selector(".text-2xl.font-bold.mt-2", text: "120"))
  end

  it "displays the total number of borrowed books" do
    render_inline(described_class.new(presenter: presenter))

    expect(page).to(have_selector(".text-green-600", text: "Total Borrowed Books"))
    expect(page).to(have_selector(".text-2xl.font-bold.mt-2", text: "45"))
  end

  it "displays the number of books due today" do
    render_inline(described_class.new(presenter: presenter))

    expect(page).to(have_selector(".text-yellow-600", text: "Books Due Today"))
    expect(page).to(have_selector(".text-2xl.font-bold.mt-2", text: "5"))
  end

  it "displays the number of members with overdue books" do
    render_inline(described_class.new(presenter: presenter))

    expect(page).to(have_selector(".text-red-600", text: "Members with Overdue Books"))
    expect(page).to(have_selector(".text-2xl.font-bold.mt-2", text: "3"))
  end
end
