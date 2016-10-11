require 'rails_helper'

RSpec.describe "horses/show", type: :view do
  before(:each) do
    @horse = assign(:horse, Horse.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
