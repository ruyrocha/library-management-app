# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Searches", type: :request) do
  before do
    @book1 = create(:book, title: "one-one", author: "one-one", genre: "one-one")
    @book2 = create(:book, title: "two", author: "two", genre: "two")
    @book3 = create(:book, title: "three", author: "three", genre: "three")
    @user = create(:user)

    sign_in(@user)
  end

  it "searches book by title" do
    get search_path, params: { query: @book1.title }

    expect(response).to(have_http_status(:success))
    expect(response.body).to(include(@book1.title))
    expect(response.body).not_to(include(@book2.title))
    expect(response.body).not_to(include(@book3.title))
  end

  it "searches book by author" do
    get search_path, params: { query: @book2.author }

    expect(response).to(have_http_status(:success))
    expect(response.body).to(include(@book2.author))
    expect(response.body).not_to(include(@book1.author))
    expect(response.body).not_to(include(@book3.author))
  end

  it "searches book by genre" do
    get search_path, params: { query: @book3.genre }

    expect(response).to(have_http_status(:success))
    expect(response.body).to(include(@book3.genre))
    expect(response.body).not_to(include(@book1.genre))
    expect(response.body).not_to(include(@book2.genre))
  end
end
