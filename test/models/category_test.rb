require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not be valid without a name' do
    category = Category.new(author: User.first, name: '', icon: 'shopping')
    assert_not category.valid?
  end

  test 'should not be valid without an icon' do
    category = Category.new(author: User.first, name: 'Shopping', icon: '')
    assert_not category.valid?
  end

  test 'should not be valid without a user' do
    category = Category.new(name: 'Shopping', icon: 'shopping')
    assert_not category.valid?
  end

  test 'should be valid and saved in the database' do
    category = Category.new(author: User.first, name: 'Rent', icon: 'rent')
    assert category.valid?
    assert category.save
  end

  test 'should have list of categories in the database' do
    category = Category.all
    assert_equal category.length, 2
  end

  test 'should have first category belong to the first user' do
    category = Category.first
    user = User.first

    assert_equal category.author, user
  end

  test 'should have expenses belong to the first category' do
    category = Category.first

    assert category.expenses.length.positive?
  end
end
