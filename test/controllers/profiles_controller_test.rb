require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should show profile" do
    get profile_url
    assert_response :success
    assert_select 'h1', 'Your Profile'
  end

  test "should get edit profile" do
    get edit_profile_url
    assert_response :success
  end

  test "should update profile" do
    patch profile_url, params: { user: { name: 'Updated Name', email: 'newemail@example.com' } }
    assert_redirected_to profile_url
    assert_equal 'Profile updated successfully.', flash[:notice]
  end

  test "should not update profile with invalid data" do
    patch profile_url, params: { user: { email: 'invalid' } }
    assert_response :unprocessable_entity
  end
end
