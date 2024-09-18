require 'test_helper'

class PetTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @pet = pets(:one)
  end

  test "should save valid pet" do
    pet = Pet.new(name: 'Buddy', breed: 'Golden Retriever', color: 'Golden', species: 'Dog', user: @user)
    assert pet.save
  end

  test "should not save pet without user" do
    pet = Pet.new(name: 'Buddy', breed: 'Golden Retriever', color: 'Golden', species: 'Dog')
    assert_not pet.save
  end

  test "should belong to a user" do
    assert_equal @user, @pet.user
  end

  test "should mount uploader for photo" do
    assert @pet.photo.present?
    assert @pet.photo.url.ends_with?('dog.jpg')
  end
end
