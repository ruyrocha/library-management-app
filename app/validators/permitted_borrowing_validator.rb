# frozen_string_literal: true

class PermittedBorrowingValidator < ActiveModel::Validator
  def validate(record)
    if record.new_record? && Inventory.exists?(book: record.book, user: record.user)
      record.errors.add(:base, "A book cannot be borrowed multiple times.")
    end
  end
end