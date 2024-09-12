require 'rails_helper'

RSpec.describe "pets/edit", type: :view do
  let(:pet) {
    Pet.create!(
      name: "MyString",
      color: "MyString",
      breed: "MyString",
      species: "MyString",
      user: nil,
      photo: "MyString"
    )
  }

  before(:each) do
    assign(:pet, pet)
  end

  it "renders the edit pet form" do
    render

    assert_select "form[action=?][method=?]", pet_path(pet), "post" do

      assert_select "input[name=?]", "pet[name]"

      assert_select "input[name=?]", "pet[color]"

      assert_select "input[name=?]", "pet[breed]"

      assert_select "input[name=?]", "pet[species]"

      assert_select "input[name=?]", "pet[user_id]"

      assert_select "input[name=?]", "pet[photo]"
    end
  end
end
