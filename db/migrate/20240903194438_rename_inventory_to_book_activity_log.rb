# frozen_string_literal: true

class RenameInventoryToBookActivityLog < ActiveRecord::Migration[7.2]
  def change
    rename_table(:inventories, :activity_logs)
  end
end
