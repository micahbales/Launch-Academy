require 'spec_helper'

# As a user
# I want to create a meetup
# So that I can gather a group of people to do an activity
#
# Acceptance Criteria:
#
# There should be a link from the meetups index page that takes you to the meetups new page. On this page there is a form to create a new meetup.
# I must be signed in, and I must supply a name, location, and description.
# If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
# If the form submission is unsuccessful, I should remain on the meetups new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

feature "user creates meetup" do

  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  scenario "logged-in user successfully creates new meetup" do

    sign_in_as user
    visit "/"
    click_link "Create a Meetup"
    fill_in('title', :with => 'My favorite meetup')
    fill_in('location', :with => 'My hometown')
    fill_in('description', :with => 'The best meetup ever!')
    click_button "Submit"

    expect(page).to have_content "Congratulations! You've created a new meetup!"

  end

  scenario "logged-in user enters inadequate information" do

    sign_in_as user
    visit "/"
    click_link "Create a Meetup"
    fill_in('location', :with => 'My hometown')
    fill_in('description', :with => 'The best meetup ever!')
    click_button "Submit"

    expect(page).to have_content "Uh-oh! Please fill in all fields to create your meetup!"
    location = find_field('location').value
    expect(location).to eq "My hometown"
    description = find_field('description').value
    expect(description).to eq "The best meetup ever!"
  end

  #  ^^^
  # expect{find_field('location').value}.to eq "My hometown"
  # expect{find_field('description').value}.to eq "The best meetup ever!"

  scenario "anonymous user un-successfully tries to create new meetup" do

    visit "/"
    click_link "Create a Meetup"

    expect(page).to have_content "You're not signed in! You should do that."

  end

end
