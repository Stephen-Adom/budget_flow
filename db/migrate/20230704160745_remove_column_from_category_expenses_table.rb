class RemoveColumnFromCategoryExpensesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_expenses, :amount, :decimal
  end
end
