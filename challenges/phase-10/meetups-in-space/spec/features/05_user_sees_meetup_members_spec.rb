require "spec_helper"

# As a user
# I want to see who has already joined a meetup
# So that I can see if any of my friends have joined
# Acceptance Criteria:
#
# On a meetup's show page, I should see a list of the members that have joined the meetup.
# I should see each member's avatar and username.

feature "user visits meetup show page" do
  let(:meetup_1) { Meetup.create(title: "Free Code Camp", location: "Washington, DC", description: "Free Code, without the camp", creator: "Quincy Larson") }
  let(:meetup_2) { Meetup.create(title: "Node.DC", location: "Arlington, VA", description: "Learn you node!", creator: "Robbie the Geek") }

  let(:micah) { User.create(provider: "github", uid: "0", username: "micahbales",
  email: "micahbales@gmail.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400") }
  let(:jarjar) { User.create(provider: "github", uid: "1", username: "jarlax1",
  email: "jarlax1@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400") }
  let(:dan) { User.create(provider: "github", uid: "2", username: "dpickett",
  email: "dp@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400") }
  let(:jenah) { User.create(provider: "github", uid: "3", username: "lightningstairs",
  email: "jenah@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400") }

  let!(:meetup_user_1) { MeetupUser.create(meetup: meetup_1, user: micah) }
  let!(:meetup_user_2) { MeetupUser.create(meetup: meetup_2, user: jarjar) }
  let!(:meetup_user_3) { MeetupUser.create(meetup: meetup_1, user: dan) }
  let!(:meetup_user_4) { MeetupUser.create(meetup: meetup_2, user: jenah) }

  scenario "sees list of meetup members with name and avatar" do

    visit "/meetups/#{meetup_1.id}"
    expect(page).to have_content "micahbales"
    expect(page).to have_content "dpickett"
    expect(page).to have_no_content "jarlax1"
    expect(page).to have_no_content "lightningstairs"
    page.all(:css, 'img.avatar-small')
  end

  scenario "see a different list of meetup members with name and avatar" do

    visit "/meetups/#{meetup_2.id}"
    expect(page).to have_content "jarlax1"
    expect(page).to have_content "lightningstairs"
    expect(page).to have_no_content "micahbales"
    expect(page).to have_no_content "dpickett"
    page.all(:css, 'img.avatar-small')
  end
end
