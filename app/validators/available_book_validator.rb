# frozen_string_literal: true

class AvailableBookValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:base, "The book is unavailable.") unless record.book.total_copies.positive?
  end
end
