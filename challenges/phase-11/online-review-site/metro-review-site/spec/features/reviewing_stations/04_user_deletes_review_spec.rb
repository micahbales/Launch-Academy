require 'rails_helper'

RSpec.feature "user deletes review" , %Q(
  As an authenticated user
  I want to delete a review
  So that irrelevant content is no longer present
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I visit a review's update page, there is an option to delete
  # [x] I am informed that the review has been removed

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  xscenario "authenticated user deletes review" do

    visit "/"
    login_user
    click_link(station.name)
    click_link(review1.title)
    click_link("Delete Review")

    expect(page).to have_content("Review deleted.")
    expect(page).to have_content(station.name)
    expect(page).to_not have_content(review1.title)

    DatabaseCleaner.clean
  end
end
