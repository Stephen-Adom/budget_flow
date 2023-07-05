require 'test_helper'

class AddExpensesFlowTest < ActionDispatch::IntegrationTest
  test 'should route to dashboard page after login' do
    get new_user_session_path
    assert_select 'h1', 'Login'

    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h1', 'Dashboard'
  end

  test 'should route to add expense page after login' do
    get new_user_session_path
    assert_select 'h1', 'Login'

    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h1', 'Dashboard'

    get category_expenses_path(category_id: Category.first.id) do
      assert_response :success
      assert_select 'h2', 'New Expense'
    end
  end

  test 'route to add expense page and add new expense' do
    get new_user_session_path
    assert_select 'h1', 'Login'

    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    get category_expenses_path(category_id: Category.first.id)

    assert_response :success
    assert_select 'h6', Category.first.name

    get new_category_expense_path(category_id: Category.first.id)
    assert_select 'h2', 'New Expense'

    # fill add expense form
    assert_select "form[action= '#{category_expenses_path(category_id: Category.first.id)}']"
    assert_select "input[name='expense[name]']"
    assert_select "input[name='expense[amount]']"
    assert_select "select[name='category_ids[]']"

    post category_expenses_path(category_id: Category.first.id), params: {
      expense: {
        author: User.find_by(email: 'stephen@gmail.com'), name: 'Buy Ticket', amount: 100
      },
      category_ids: [Category.first.id]
    }

    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h6', 'Buy Ticket'
  end
end
