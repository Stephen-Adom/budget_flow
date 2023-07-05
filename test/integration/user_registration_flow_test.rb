require 'test_helper'

class UserRegistrationFlowTest < ActionDispatch::IntegrationTest
  test 'should route to registration page' do
    get new_user_registration_path
    assert_response :success
  end

  test 'can register a user with valid credentials' do
    post user_registration_path,
         params: { user: { name: 'Adam Sandler', email: 'adam@mail.com', password: 'password',
                           password_confirmation: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'Dashboard'
  end
end
