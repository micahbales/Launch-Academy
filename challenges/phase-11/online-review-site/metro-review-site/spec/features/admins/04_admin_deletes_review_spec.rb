require 'rails_helper'

RSpec.feature "admin deletes review" , %Q(
  As an admin user,
  I want to delete a review,
  So that only helpful reviews are displayed
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user with admin privileges
  # [x] When I view a station's reviews, each one gives me the option
  #    to delete it

  let!(:user1) { FactoryGirl.create(:user, email: "micahbales@gmail.com", admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:review1) { FactoryGirl.create(:review) }

  scenario "admin user deletes review" do

    visit "/"
    login_admin
    click_link("Benning Road Station")
    click_link(review1.title)
    click_link("Delete Review")

    expect(page).to have_content("Review deleted.")
    expect(page).to have_content("Benning Road Station")
    expect(page).to_not have_content(review1.title)

    DatabaseCleaner.clean
  end

  xscenario "non-admin user cannot delete review" do

    visit "/"
    login_user
    click_link("Benning Road Station")
    click_link(review1.title)
    click_link("Delete Review")

    expect(page).to_not have_content("Review deleted.")
    expect(page).to_not have_content("Benning Road Station")
    expect(page).to have_content(review1.title)

    DatabaseCleaner.clean
  end
end
