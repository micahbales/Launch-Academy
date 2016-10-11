require 'rails_helper'

RSpec.describe "horses/new", type: :view do
  before(:each) do
    assign(:horse, Horse.new(
      :name => "MyString"
    ))
  end

  it "renders new horse form" do
    render

    assert_select "form[action=?][method=?]", horses_path, "post" do

      assert_select "input#horse_name[name=?]", "horse[name]"
    end
  end
end
