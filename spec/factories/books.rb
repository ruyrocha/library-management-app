# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    author { FFaker::Book.author }
    genre { FFaker::Book.genre }
    isbn { FFaker::Book.isbn }
    total_copies { rand(50...50_000) }
  end
end
