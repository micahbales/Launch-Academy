require 'rails_helper'

RSpec.feature "user views reviews" , %Q(
  As a website visitor
  I want to see the reviews of a station
  So that I can decide whether to commute there
) do

  # Acceptance Criteria:

  # [x] I may be anonymous user
  # [x] When I visit a station page, I see all reviews for that page

  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }
  let!(:review2) { FactoryGirl.create(:review, station: station) }

  scenario "anonymous user views reviews" do
    visit "/"
    click_link station.name

    expect(page).to have_content(review1.title)
    expect(page).to have_content(review2.title)

    DatabaseCleaner.clean
  end
end
