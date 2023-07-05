require 'test_helper'

class CategoryExpenseTest < ActiveSupport::TestCase
  test 'should not be valid without a category and expense' do
    category_expense = CategoryExpense.new

    assert_not category_expense.valid?
  end

  test 'should be valid and saved in the database' do
    category_expense = CategoryExpense.new(category: Category.first, expense: Expense.first)

    assert category_expense.valid?
    assert category_expense.save
  end

  test 'should belong to the first category in the database' do
    category_expense = CategoryExpense.first
    category = Category.first
    assert_equal category_expense.category, category
  end

  test 'should belong to the first expense in the database' do
    category_expense = CategoryExpense.first
    expense = Expense.first
    assert_equal category_expense.expense, expense
  end
end
