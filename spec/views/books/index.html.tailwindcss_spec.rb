# frozen_string_literal: true

require "rails_helper"

RSpec.describe("books/index", type: :view) do
  before(:each) do
    allow(view).to(receive(:can?).and_return(true))

    assign(:books, [
      Book.create!(
        title: "Title",
        author: "Author",
        genre: "Genre",
        isbn: "Isbn",
        total_copies: 2,
      ),
      Book.create!(
        title: "Title",
        author: "Author",
        genre: "Genre",
        isbn: "Isbn",
        total_copies: 2,
      ),
    ])
  end

  xit "renders a list of books" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Author".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Genre".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Isbn".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
