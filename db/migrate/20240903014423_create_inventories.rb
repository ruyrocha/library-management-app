# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table(:inventories) do |t|
      t.references(:user, null: false, foreign_key: true)
      t.references(:book, null: false, foreign_key: true)
      t.datetime(:borrowed_at)
      t.datetime(:returned_at)
      t.datetime(:due_at)

      t.timestamps
    end
  end
end
