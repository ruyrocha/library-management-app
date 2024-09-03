# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Inventory, type: :model) do
  it "allows user with member role to borrow the book if it is available"
  it "does not allow user with member role to borrow the book if it is unavailable"
  it "does not allow user with member role to borrow the same book multiple times"
  it "tracks when a book was borrowed"
  it "tracks when a book returning's date is due (2 weeks from the borrowing date)"
  it "allows user with librarian role to mark a book as returned"
end
