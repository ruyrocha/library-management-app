# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Borrowings", type: :request) do
  describe "POST /create" do
    it "borrows a book" do
      user = create(:user)
      book = create(:book)

      sign_in(user)

      expect { post(book_borrow_path(book)) }.to(change(Inventory, :count).by(1))
    end
  end
end
