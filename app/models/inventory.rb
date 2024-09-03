# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_with AvailableBookValidator
  validates_with PermittedBorrowingValidator

  after_validation :set_borrowed_at, on: :create
  after_validation :set_due_at, on: :create

  after_commit :decrease_book_total_copies_by_one, on: :create

  private

  def decrease_book_total_copies_by_one
    total_copies = book.total_copies
    book.update!(total_copies: total_copies - 1)
  end

  def set_borrowed_at = self.borrowed_at = Time.current

  def set_due_at = self.due_at = 2.weeks.from_now
end
