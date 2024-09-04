# frozen_string_literal: true

if Book.count.zero?

  BOOKS = [
    {
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      genre: "Fiction",
      isbn: "978-0060935467",
    },
    {
      title: "1984",
      author: "George Orwell",
      genre: "Dystopian Fiction",
      isbn: "978-0451524935",
    },
    {
      title: "The Catcher in the Rye",
      author: "J.D. Salinger",
      genre: "Fiction",
      isbn: "978-0316769488",
    },
    {
      title: "Pride and Prejudice",
      author: "Jane Austen",
      genre: "Romance",
      isbn: "978-1503290563",
    },
    {
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      genre: "Fiction",
      isbn: "978-0743273565",
    },
    {
      title: "The Lord of the Rings",
      author: "J.R.R. Tolkien",
      genre: "Fantasy",
      isbn: "978-0261102385",
    },
    {
      title: "Harry Potter and the Philosopher's Stone",
      author: "J.K. Rowling",
      genre: "Fantasy",
      isbn: "978-0747532699",
    },
    {
      title: "The Diary of a Young Girl",
      author: "Anne Frank",
      genre: "Biography",
      isbn: "978-0553296983",
    },
    {
      title: "The Alchemist",
      author: "Paulo Coelho",
      genre: "Fiction",
      isbn: "978-0062315007",
    },
    {
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      genre: "Fantasy",
      isbn: "978-0261102217",
    },
  ].freeze

  BOOKS.each { |book| Book.create!(book.merge(total_copies: 2)) }
end

if User.count.zero?
  PASSWORD = "abcde123456"
  # member
  User.create!(email: "member@example.com", password: PASSWORD)
  # librarian
  librarian = User.create!(email: "librarian@example.com", password: PASSWORD)
  librarian.remove_role(:member)
  librarian.add_role(:librarian)
end
