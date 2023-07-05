require 'test_helper'

class UserLoginFlowTest < ActionDispatch::IntegrationTest
  test 'can route to the login page' do
    get new_user_session_path
    assert_response :success
  end

  test 'return unprocessable entity error when credentials is not valid' do
    post user_session_path, params: { user: { email: 'stephen', password: 'password' } }
    assert_response :unprocessable_entity
  end

  test 'can login with valid credentials' do
    post user_session_path, params: { user: { email: 'stephen@gmail.com', password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
