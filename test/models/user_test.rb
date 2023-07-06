require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should be valid with a name' do
    user = User.new(name: 'John Doe', email: 'john@doe.com', password: '12345678')
    assert user.valid?
  end

  test 'should be valid and saved in the database' do
    user = User.new(name: 'John Doe', email: 'john@doe.com', password: '12345678')
    assert user.valid?
    assert user.save
  end

  test 'should be invalid without a name' do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
  end

  test 'should be invalid without a email' do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test 'should be invalid without a password' do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end
end
