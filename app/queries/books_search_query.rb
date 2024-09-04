# frozen_string_literal: true

class BooksSearchQuery
  def initialize(search_params = {})
    @query = search_params.delete(:query)
    @relation = Book
  end

  def call
    query = "%#{@query.downcase}%"

    title_condition = Book.arel_table[:title].lower.matches(query)
    author_condition = Book.arel_table[:author].lower.matches(query)
    genre_condition = Book.arel_table[:genre].lower.matches(query)

    @relation.where(
      title_condition.or(author_condition).or(genre_condition),
    )
  end

  private

  attr_reader :query, :relation
end
