# frozen_string_literal: true

require "rails_helper"

RSpec.describe(MemberDashboardComponent, type: :component) do
  context "when there are borrowed books and overdue books" do
    let(:presenter) do
      double(
        books: [
          double(book: double(title: "Book 1"), due_at: "2024-09-15"),
          double(book: double(title: "Book 2"), due_at: "2024-09-20"),
        ],
        overdue_books: [
          double(book: double(title: "Overdue Book 1"), due_at: "2024-08-15"),
          double(book: double(title: "Overdue Book 2"), due_at: "2024-08-20"),
        ],
      )
    end

    it "displays the borrowed books" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_selector('[data-testid="books-borrowed-section"]'))
      expect(page).to(have_selector('[data-testid="borrowed-book"]', text: "Book 1"))
      expect(page).to(have_selector('[data-testid="borrowed-book"]', text: "Book 2"))
      expect(page).to(have_selector('[data-testid="borrowed-book-due-date"]', text: "2024-09-15"))
      expect(page).to(have_selector('[data-testid="borrowed-book-due-date"]', text: "2024-09-20"))
    end

    it "displays the overdue books" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_selector('[data-testid="books-overdue-section"]'))
      expect(page).to(have_selector('[data-testid="overdue-book"]', text: "Overdue Book 1"))
      expect(page).to(have_selector('[data-testid="overdue-book"]', text: "Overdue Book 2"))
      expect(page).to(have_selector('[data-testid="borrowed-book-due-date"]', text: "2024-09-15"))
      expect(page).to(have_selector('[data-testid="borrowed-book-due-date"]', text: "2024-09-20"))
    end
  end

  context "when there are no borrowed books" do
    let(:presenter) do
      double(
        books: [],
        overdue_books: [
          double(book: double(title: "Overdue Book 1"), due_at: "2024-08-15"),
        ],
      )
    end

    it "displays a message when no borrowed books are present" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_text("You have not borrowed any books."))
    end

    it "does not display borrowed books" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_selector('[data-testid="no-borrowed-books"]'))
    end
  end

  context "when there are no overdue books" do
    let(:presenter) do
      double(
        books: [
          double(book: double(title: "Book 1"), due_at: "2024-09-15"),
        ],
        overdue_books: [],
      )
    end

    it "does not display overdue books" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_selector('[data-testid="no-overdue-books"]'))
    end

    it "displays a message when no overdue books are present" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_text("You have no overdue books."))
    end
  end

  context "when there are no borrowed books and no overdue books" do
    let(:presenter) do
      double(
        books: [],
        overdue_books: [],
      )
    end

    it "displays a message when no borrowed books are present" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_text("You have not borrowed any books."))
    end

    it "displays a message when no overdue books are present" do
      render_inline(described_class.new(presenter: presenter))

      expect(page).to(have_text("You have no overdue books."))
    end
  end
end
