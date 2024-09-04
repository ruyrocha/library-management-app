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

## API Endpoints

- Develop a RESTful API that allows CRUD operations for books and borrowings.
- Ensure proper status codes and responses for each endpoint.
- Testing should be done with RSPEC. i. Spec files should be included for all
  the requirements above.
  - manual test with curl can be performed using the credentials you may have
    set on `.env`

### Screenshots

Manual tests performed using HTTPie.

#### GET /api/v1/books

![Screenshot from 2024-09-04 12-09-53](https://github.com/user-attachments/assets/b18186db-af32-4989-a4ea-96905bc57ace)

#### GET /api/v1/books/:id

![Screenshot from 2024-09-04 12-10-14](https://github.com/user-attachments/assets/edac30f6-24a7-434d-963c-8421d23d0187)

#### PUT/PATCH /api/v1/books/:id

![Screenshot from 2024-09-04 12-11-03](https://github.com/user-attachments/assets/e35cc6f3-ca34-426d-8396-3e5beabd3dd5)

#### POST /api/v1/books

![Screenshot from 2024-09-04 12-11-52](https://github.com/user-attachments/assets/00301bef-c1fa-4d01-94e5-d5ef7e2cc25c)

#### DELETE /api/v1/books/:id

![Screenshot from 2024-09-04 12-12-35](https://github.com/user-attachments/assets/6d00e84f-c64d-4d24-962b-44735908eb0e)

#### POST /api/v1/books/:id/borrow

![Screenshot from 2024-09-04 13-04-09](https://github.com/user-attachments/assets/d61c6255-d8f5-445c-8ce2-dcd4e834e343)


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

### Screenshots

![Screenshot from 2024-09-04 11-24-12](https://github.com/user-attachments/assets/f350141f-f265-4027-b15e-11a5b6b23ea3)
![Screenshot from 2024-09-04 11-23-45](https://github.com/user-attachments/assets/6389d75f-b239-4d40-a77d-d2e976be7be4)
![Screenshot from 2024-09-04 11-25-04](https://github.com/user-attachments/assets/c7cb2a40-eea7-44be-ba7c-5abd59cfd07c)
![Screenshot from 2024-09-04 11-24-58](https://github.com/user-attachments/assets/f6a95492-25af-4e7b-a09d-655f3164dac0)

## Search

- Search functionality: Users should be able to search for a book by title,
  author, or genre.
  - there's a query object to take care of this, and it's going to perform a
    case-insensitive search using the provided title, author or genre.
  - see [http://localhost:3000/search](http://localhost:3000/search) in your
    browser.

### Screenshots

![Screenshot from 2024-09-04 12-22-48](https://github.com/user-attachments/assets/87d9bbc7-3656-4734-a43a-459e814e13ef)
![Screenshot from 2024-09-04 12-22-02](https://github.com/user-attachments/assets/6bea611d-b294-4fc1-94e8-ce3bffb432ae)
![Screenshot from 2024-09-04 12-21-38](https://github.com/user-attachments/assets/8a7dfb0c-337d-4adc-af4d-3a970476b4e3)

## Borrowing and Returning

- Member users should be able to borrow a book if it's available. They can't
  borrow the same book multiple times.
  - it is enforced by the
    [./app/validators/permitted_borrowing_validator.rb](./app/validators/permitted_borrowing_validator.rb)
- The system should track when a book was borrowed and when it's due (2 weeks
  from the borrowing date).
- Librarian users can mark a book as returned.

### Screenshots

![Screenshot from 2024-09-04 11-24-35](https://github.com/user-attachments/assets/23d6cc30-0689-495f-aab5-15ed229533cb)
![Screenshot from 2024-09-04 11-24-50](https://github.com/user-attachments/assets/636723f0-f07f-47db-aa11-76195a1e8bc9)

## Dashboard

- Librarian: A dashboard showing total books, total borrowed books, books due
  today, and a list of members with overdue books.
- Member: A dashboard showing books they've borrowed, their due dates, and any
  overdue books.

### Screenshots

![Screenshot from 2024-09-04 11-19-31](https://github.com/user-attachments/assets/ea5be56d-688b-464c-a543-4b9700fa8799)

## Frontend

- ~~Fulls of TODOs and bugs~~

