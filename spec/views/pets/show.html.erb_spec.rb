require 'rails_helper'

RSpec.describe "pets/show", type: :view do
  before(:each) do
    assign(:pet, Pet.create!(
      name: "Name",
      color: "Color",
      breed: "Breed",
      species: "Species",
      user: nil,
      photo: "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Breed/)
    expect(rendered).to match(/Species/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Photo/)
  end
end
