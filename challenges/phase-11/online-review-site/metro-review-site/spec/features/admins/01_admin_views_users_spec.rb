require 'rails_helper'

RSpec.feature "admin views all users" , %Q(
  As an admin user,
  I want to view a list of all users,
  So that I can administrate them
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user with admin privileges
  # [x] When I visit the users list, I can see all registered users

  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user, first_name: "James",
    last_name: "Baldwin", email: "jimmyb@juno.com") }

  scenario "admin visits users index" do

    visit "/"
    login_user
    click_link("View All Users")

    expect(page).to have_content("Bob Builder")
    expect(page).to have_content("James Baldwin")

    DatabaseCleaner.clean
  end

  scenario "non-admin user cannot visit users index" do

    visit "/"

    expect(page).to_not have_content("View All Users")

    DatabaseCleaner.clean
  end
end
