# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { "abcde1234567" }
    password_confirmation { "abcde1234567" }
  end

  trait :with_librarian_role do
    after(:create) do |user, _|
      user.add_role(:librarian)
    end
  end
end
