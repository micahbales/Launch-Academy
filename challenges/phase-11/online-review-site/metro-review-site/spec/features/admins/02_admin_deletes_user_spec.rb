require 'rails_helper'

RSpec.feature "admin deletes user" , %Q(
  As an admin user,
  I want to delete a user,
  So that the database is cleared of inactive or abusive users
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user with admin privileges
  # [x] On the users index page, I can view all registered users
  # [x] When I visit the users index page, I can delete any listed user

  let!(:admin) { FactoryGirl.create(:user, first_name: "Micah", last_name: "Bales", email: "micahbales@gmail.com", password: "password", admin: true) }
  let!(:user2) { FactoryGirl.create(:user, email: "bobby@builder.com") }
  let!(:user3) { FactoryGirl.create(:user, first_name: "James",
    last_name: "Baldwin", email: "jimmyb@juno.com") }

  scenario "admin deletes user" do

    visit "/"
    login_admin
    click_link("View All Users")
    click_link("user-delete-#{user2.id}")

    expect(page).to_not have_content("Bob Builder")
    expect(page).to have_content("James Baldwin")
    expect(page).to have_content("Micah Bales")
    # expect(page).to have_content("User deleted!")

    DatabaseCleaner.clean
  end
end
