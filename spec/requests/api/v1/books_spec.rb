# frozen_string_literal: true

require "rails_helper"

RSpec.describe("/api/v1/books", type: :request) do
  def valid_attributes = attributes_for(:book)
  def invalid_attributes = { something: :else }
  def username = ENV["API_AUTH_USERNAME"]
  def password = ENV["API_AUTH_PASSWORD"]

  def auth_headers
    {
      Authorization: "Basic #{Base64.strict_encode64("#{username}:#{password}")}",
    }
  end

  def user = create(:user, :with_librarian_role)

  describe "GET /index" do
    it "renders a successful response" do
      create(:book)

      get api_v1_books_url, headers: auth_headers

      expect(response).to(have_http_status(:success))
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book = Book.create!(valid_attributes)

      get api_v1_book_url(book), headers: auth_headers

      expect(response).to(be_successful)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_api_v1_book_url, headers: auth_headers

      expect(response).to(be_successful)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      book = Book.create!(valid_attributes)
      get edit_api_v1_book_url(book), headers: auth_headers

      expect(response).to(be_successful)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect do
          post(api_v1_books_url, params: { book: valid_attributes }, headers: auth_headers)
        end.to(change(Book, :count).by(1))
      end

      it "redirects to the created book" do
        post api_v1_books_url, params: { book: valid_attributes }, headers: auth_headers

        expect(response).to(have_http_status(:created))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect do
          post(api_v1_books_url, params: { book: invalid_attributes }, headers: auth_headers)
        end.to(change(Book, :count).by(0))
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post api_v1_books_url, params: { book: invalid_attributes }, headers: auth_headers

        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested book" do
        new_attributes = { title: FFaker::Book.title }
        book = create(:book)

        patch api_v1_book_url(book), params: { book: new_attributes }, headers: auth_headers

        book.reload

        expect(response).to(have_http_status(:no_content))
        expect(book.title).to(eq(new_attributes[:title]))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        book = create(:book)

        patch api_v1_book_url(book), params: { book: invalid_attributes }, headers: auth_headers

        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      book = Book.create!(valid_attributes)
      expect do
        delete(api_v1_book_url(book), headers: auth_headers)
      end.to(change(Book, :count).by(-1))
    end

    it "redirects to the books list" do
      book = Book.create!(valid_attributes)

      delete api_v1_book_url(book), headers: auth_headers

      expect(response).to(have_http_status(:no_content))
    end
  end
end
