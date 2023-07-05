require 'test_helper'

class AddCategoryFlowTest < ActionDispatch::IntegrationTest
  test 'should route to dashboard page after login' do
    get new_user_session_path
    assert_select 'h1', 'Login'

    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h1', 'Dashboard'
  end

  test 'should route to add category page after login' do
    get new_user_session_path
    assert_select 'h1', 'Login'

    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h1', 'Dashboard'

    get new_category_path
    assert_response :success

    assert_select 'h2', 'New Category'
  end

  test 'route to add category page and add new category' do
    get new_user_session_path
    assert_select 'h1', 'Login'

    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    get new_category_path
    assert_response :success

    # fill add category form
    assert_select "form[action= '#{categories_path}']" do
      assert_select "input[name='category[name]']"
      assert_select "select[name='category[icon]']"

      post categories_path,
           params: { category: { author: User.find_by(email: 'stephen@gmail.com'), name: 'Movies',
                                 icon: 'entertainment' } }

      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    assert_select 'span', 'Movies'
    assert_select 'small', User.find_by(email: 'stephen@gmail.com').name
  end
end
