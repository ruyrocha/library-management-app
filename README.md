# Library Management App

## Development setup

1. Clone this repo and install the dependencies using `bundler`.
2. Copy `.env.example` to `.env`, adjust it accordingly.
3. Create the database & add seeds, e.g: `rails db:setup && rails db:seed`
4. Start the app with `./bin/dev`

Or if you don't want to play with odd views, just run the test suite:

```ruby
bundle exec rspec --format documentation
```

## Authentication and Authorization

- Users should be able to register, log in, and log out.

  - Authentication is handled by Devise, so end-points like
    [/users/sign_in](http://127.0.0.1:3000/users/sign_in) will work.

- There are two types of users: librarian and member.

  - They're seeded by default, e.g:
    1. <member@example.com> - abcde123456
    2. <librarian@example.com> - abcde123456

## Book Management

- Ability to add a new book with details like title, author, genre, ISBN, and
  total copies.

- Ability to edit and delete book details.

- Only Librarian users should be able to add, edit, or delete books.

  - The abilities for each user is defined on
    [./app/models/ability.rb](./app/models/ability.rb)
  - user with member role can only read Books
  - user with librarian role can manage Books.
  - manual test can be done using different roles on `/books`

## Search

- Search functionality: Users should be able to search for a book by title,
  author, or genre.
  - there's a query object to take care of this, and it's going to perform a
    case-insensitive search using the provided title, author or genre.
  - see [http://localhost:3000/search](http://localhost:3000/search) in your
    browser.

## Borrowing and Returning

- Member users should be able to borrow a book if it's available. They can't
  borrow the same book multiple times.
  - it is enforced by the
    [./app/validators/permitted_borrowing_validator.rb](./app/validators/permitted_borrowing_validator.rb)
- The system should track when a book was borrowed and when it's due (2 weeks
  from the borrowing date).
- Librarian users can mark a book as returned.

## Dashboard

- Librarian: A dashboard showing total books, total borrowed books, books due
  today, and a list of members with overdue books.
- Member: A dashboard showing books they've borrowed, their due dates, and any
  overdue books.

## API Endpoints

- Develop a RESTful API that allows CRUD operations for books and borrowings.
- Ensure proper status codes and responses for each endpoint.
- Testing should be done with RSPEC. i. Spec files should be included for all
  the requirements above.
  - manual test with curl can be performed using the credentials you may have
    set on `.env`

## Frontend

- ~~Fulls of TODOs and bugs~~
