require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:title).when('This is great', 'zyx') }
  it { should_not have_valid(:title).when(nil, '')}

  it { should have_valid(:content).when('Benning Road station is a great one!', 'Yo.') }
  it { should_not have_valid(:content).when(nil, '') }

  it "displays total votes" do
    review = FactoryGirl.create(:review)
    user = FactoryGirl.create(:user)
    vote1 = FactoryGirl.create(:vote, user: user, review: review)
    vote2 = FactoryGirl.create(:vote, user: user, review: review)
    vote3 = FactoryGirl.create(:vote, user: user, review: review, value: -1)

    expect(review.vote_total).to eq 1

  end
  DatabaseCleaner.clean
end
