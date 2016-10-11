require 'rails_helper'

RSpec.describe "horses/index", type: :view do
  before(:each) do
    assign(:horses, [
      Horse.create!(
        :name => "Name"
      ),
      Horse.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of horses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
