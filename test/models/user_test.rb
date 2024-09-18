require 'test_helper'

class UserTest < ActiveSupport::TestCase
    fixtures :users

  setup do
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should set default role to user" do
    user = users(:user_one)
    assert_equal 0, user.role
  end

  test "fixtures load correctly" do
    assert_equal 2, User.count
    assert_equal 2, Post.count
  end
  
  test "should save valid user" do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
    assert user.save
  end

  test "should not save user without email" do
    user = User.new(name: 'John Doe', password: 'password123')
    assert_not user.save
  end

  test "should set default role to user" do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
    assert_equal 'user', user.role
  end

  test "should assign admin role correctly" do
    @admin.role = 'admin'
    assert_equal 'admin', @admin.role
  end

  test "should generate account number before create" do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
    user.save
    assert_not_nil user.account_number
    assert_match /\A\d{4}\d{8}\z/, user.account_number, "Account number format is incorrect"
  end

  test "should authenticate active user" do
    @user.approved = true
    assert @user.active_for_authentication?
  end

  test "should not authenticate inactive user" do
    @user.approved = false
    assert_not @user.active_for_authentication?
  end

  test "should return inactive message if not approved" do
    @user.approved = false
    assert_equal :not_approved, @user.inactive_message
  end

  test "should return super inactive message if approved" do
    @user.approved = true
    assert_not_equal :not_approved, @user.inactive_message
  end

  test "should find existing user from omniauth" do
    auth_data = {
      info: {
        email: @user.email,
        name: @user.name
      }
    }
    user = User.from_omniauth(OpenStruct.new(auth_data))
    assert_equal @user, user
  end
end
