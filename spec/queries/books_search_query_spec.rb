# frozen_string_literal: true

require "rails_helper"

RSpec.describe(BooksSearchQuery) do
  it "searches books by title" do
    book1 = create(:book, title: "one")
    book2 = create(:book, title: "two")

    exercise = described_class.new(title: "ONE").call

    expect(exercise).to(include(book1))
    expect(exercise).not_to(include(book2))
  end

  it "searches books by author" do
    book1 = create(:book, author: "one")
    book2 = create(:book, author: "two")

    exercise = described_class.new(author: "ONE").call

    expect(exercise).to(include(book1))
    expect(exercise).not_to(include(book2))
  end

  it "searches books by genre" do
    book1 = create(:book, genre: "one")
    book2 = create(:book, genre: "two")

    exercise = described_class.new(genre: "ONE").call

    expect(exercise).to(include(book1))
    expect(exercise).not_to(include(book2))
  end

  it "searches books by title, author and genre" do
    create_list(:book, 5)
    wanted_book = Book.first

    exercise = described_class.new(
      title: wanted_book.title,
      author: wanted_book.author,
      genre: wanted_book.genre,
    ).call

    expect(exercise).to(include(wanted_book))
  end
end
