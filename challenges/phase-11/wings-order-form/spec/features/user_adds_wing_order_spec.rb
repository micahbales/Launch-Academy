require "rails_helper"

feature "user adds wing order" do
  let!(:honey_bbq_flavor) { Flavor.create(name: "Honey BBQ") }
  let!(:sweet_chili_flavor) { Flavor.create(name: "Sweet Chili") }

  scenario "successfully orders wings" do
    visit new_wing_order_path

    fill_in "Full Name", with: "Gene Parmesean"
    fill_in "City", with: "Boston"
    select "Massachusetts", from: "State"
    choose "100 wings"
    check "Add Ranch Dressing"
    check "Honey BBQ"
    check "Sweet Chili"
    click_button "Place Order"

    expect(page).to have_content("Gene Parmesean")
    expect(page).to have_content("Boston")
    expect(page).to have_content("MA")
    expect(page).to have_content("100")
    expect(page).to have_content("Ranch")
    expect(page).to have_content("Honey BBQ")
    expect(page).to have_content("Sweet Chili")
  end
end
