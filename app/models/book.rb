# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :author, :genre, :isbn, :total_copies, presence: true

  resourcify
end
