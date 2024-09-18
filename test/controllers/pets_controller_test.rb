require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @admin = users(:admin)
    @pet = pets(:one)
    sign_in @user
  end

  test "should get index for user" do
    get pets_url
    assert_response :success
    assert_select 'h1', 'Your Pets'
  end

  test "should get index for admin" do
    sign_in @admin
    get pets_url
    assert_response :success
    assert_select 'h1', 'All Pets'
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get new pet" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { name: 'Rex', breed: 'Bulldog', color: 'Brown', species: 'Dog', user_id: @user.id, photo: fixture_file_upload('test/fixtures/files/dog.jpg', 'image/jpeg') } }
    end
    assert_redirected_to pet_url(Pet.last)
    assert_equal 'Pet was successfully created.', flash[:notice]
  end

  test "should not create pet with invalid data" do
    post pets_url, params: { pet: { name: '', breed: '', color: '', species: '' } }
    assert_response :unprocessable_entity
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { name: 'Max' } }
    assert_redirected_to pet_url(@pet)
    assert_equal 'Pet was successfully updated.', flash[:notice]
  end

  test "should delete pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet)
    end
    assert_redirected_to pets_url
    assert_equal 'Pet was successfully deleted.', flash[:notice]
  end

  test "should report pet missing and create post" do
    patch report_missing_pet_url(@pet)
    assert_redirected_to post_url(Post.last)
    assert_equal 'The pet has been reported missing and a post has been created.', flash[:notice]
  end
end
