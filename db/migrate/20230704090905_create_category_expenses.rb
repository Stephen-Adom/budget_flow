# frozen_string_literal: true

class CreateCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenses do |t|
      t.references :category, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
