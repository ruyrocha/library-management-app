# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :author, :genre, :isbn, :total_copies, presence: true

  has_many :activity_logs, dependent: :destroy

  resourcify
end
