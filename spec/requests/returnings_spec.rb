# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Returnings", type: :request) do
  describe "POST /create" do
    it "does not allow user with member role to return book" do
      user = create(:user)
      book = create(:book)

      sign_in(user)

      expect { post(book_return_path(book)) }.to(raise_error(ReturningService::NotPermittedError))
    end

    it "allows user with librarian role to return book" do
      user = create(:user, :with_librarian_role)
      book = create(:book, total_copies: 1)
      total_copies = book.total_copies

      sign_in(user)

      post(book_return_path(book))

      expect(book.reload.total_copies).to(eq(total_copies + 1))
    end
  end
end
