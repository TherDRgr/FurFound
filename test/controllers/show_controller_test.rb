require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should show post" do
    get show_post_url(@post)
    assert_response :success
  end

  test "should notify user" do
    post notify_user_url(@post), params: { latitude: 10.0, longitude: 20.0 }
    assert_redirected_to post_url(@post)
    assert_equal 'User has been notified, thank you!', flash[:notice]
  end
end
