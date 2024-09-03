# frozen_string_literal: true

class BooksSearchQuery
  def initialize(search_params = {})
    @title = search_params.delete(:title)
    @author = search_params.delete(:author)
    @genre = search_params.delete(:genre)
    @relation = Book
  end

  def call
    @relation = by_title if @title
    @relation = by_author if @author
    @relation = by_genre if @genre
    @relation.all
  end

  def by_title
    @relation.where(
      Book.arel_table[:title].lower.matches("%#{@title.downcase}%"),
    )
  end

  def by_author
    @relation.where(
      Book.arel_table[:author].lower.matches("%#{@author.downcase}%"),
    )
  end

  def by_genre
    @relation.where(
      Book.arel_table[:genre].lower.matches("%#{@genre.downcase}%"),
    )
  end

  private

  attr_reader :title, :author, :genre, :relation
end
