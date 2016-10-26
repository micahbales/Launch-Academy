require 'rails_helper'

RSpec.feature "user adds review" , %Q(
  As an authenticated user
  I want to write a review
  So that others can know what I think about a station
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I visit a station page, there is form to write a review
  # [x] I must fill in review content and hit a submit button
  # [x] If I fail to enter content, I will receive an error
  # [x] If I enter valid content, I am informed that my review
  #    has been added to the site

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }

  scenario "authenticated user writes valid review" do

    visit "/"
    login_user
    click_link("Benning Road Station")
    fill_in("Title", with: "Just My Two Cents")
    fill_in("Review", with: "Boy, this station stinks!")
    click_button("Submit Review")

    expect(page).to have_content("Just My Two Cents")
    expect(page).to have_content("Boy, this station stinks!")
    expect(page).to have_content("Your comment has been successfully created!")

    DatabaseCleaner.clean
  end

  scenario "authenticated user submits review without content" do

    visit "/"
    login_user
    click_link("Benning Road Station")
    fill_in("Title", with: "Just My Two Cents")
    click_button("Submit Review")

    expect(page).to_not have_content("Just My Two Cents")
    expect(page).to have_content("Please provide both a title and a review")

    DatabaseCleaner.clean
  end

  scenario "unauthenticated user tries to submit a review" do

    visit "/"
    click_link("Benning Road Station")
    
    expect(page).to_not have_content("Submit Review")

    DatabaseCleaner.clean
  end
end
