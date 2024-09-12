require 'rails_helper'

RSpec.describe "pets/index", type: :view do
  before(:each) do
    assign(:pets, [
      Pet.create!(
        name: "Name",
        color: "Color",
        breed: "Breed",
        species: "Species",
        user: nil,
        photo: "Photo"
      ),
      Pet.create!(
        name: "Name",
        color: "Color",
        breed: "Breed",
        species: "Species",
        user: nil,
        photo: "Photo"
      )
    ])
  end

  it "renders a list of pets" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Color".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Breed".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Species".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Photo".to_s), count: 2
  end
end
