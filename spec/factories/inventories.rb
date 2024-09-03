FactoryBot.define do
  factory :inventory do
    user { nil }
    book { nil }
    borrowed_at { "2024-09-02 22:44:24" }
    returned_at { "2024-09-02 22:44:24" }
    due_at { "2024-09-02 22:44:24" }
  end
end
