require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test 'expense should not be valid without a name' do
    expense = Expense.new(author: User.first, name: '', amount: 100)

    assert_not expense.valid?
  end

  test 'expense should not be valid without a user' do
    expense = Expense.new(name: 'Buy shoe', amount: 100)

    assert_not expense.valid?
  end

  test 'expense should be valid and saved in the database' do
    expense = Expense.new(author: User.first, name: 'Buy shoe', amount: 100)

    assert expense.valid?
    assert expense.save
  end

  test 'first expense belong to the first user' do
    expense = Expense.first
    user = User.first

    assert_equal expense.author, user
  end

  test 'should have at least one category' do
    expense = Expense.first

    assert expense.categories.length.positive?
  end
end
