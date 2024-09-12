require 'rails_helper'

RSpec.describe "pets/new", type: :view do
  before(:each) do
    assign(:pet, Pet.new(
      name: "MyString",
      color: "MyString",
      breed: "MyString",
      species: "MyString",
      user: nil,
      photo: "MyString"
    ))
  end

  it "renders new pet form" do
    render

    assert_select "form[action=?][method=?]", pets_path, "post" do

      assert_select "input[name=?]", "pet[name]"

      assert_select "input[name=?]", "pet[color]"

      assert_select "input[name=?]", "pet[breed]"

      assert_select "input[name=?]", "pet[species]"

      assert_select "input[name=?]", "pet[user_id]"

      assert_select "input[name=?]", "pet[photo]"
    end
  end
end
