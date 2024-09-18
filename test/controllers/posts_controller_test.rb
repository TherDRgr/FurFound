require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
    fixtures :posts
    
  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_select 'h1', 'Lost Pets'
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get new post" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { name: 'Missing Dog', color: 'Black', species: 'Dog', breed: 'Labrador', last_seen_location: 'Park', date_reported: Date.today, photo: fixture_file_upload('test/fixtures/files/dog.jpg', 'image/jpeg') } }
    end
    assert_redirected_to post_url(Post.last)
    assert_equal 'Post was successfully created.', flash[:notice]
  end

  test "should update post" do
    patch post_url(@post), params: { post: { name: 'Updated Post' } }
    assert_redirected_to post_url(@post)
    assert_equal 'Post was successfully updated.', flash[:notice]
  end

  test "should delete post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
  end

  test "should prevent unauthorized user from editing or deleting post" do
    another_post = posts(:two)
    patch post_url(another_post), params: { post: { name: 'Invalid Update' } }
    assert_redirected_to posts_url
    assert_equal 'Not authorized to edit or delete this post', flash[:alert]
  end
end
