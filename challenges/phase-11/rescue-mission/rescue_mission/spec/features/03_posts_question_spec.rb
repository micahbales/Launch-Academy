require 'rails_helper'

# As a user
# I want to post a question
# So that I can receive help from others
#
# Acceptance Criteria
#
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

feature "user posts question" do

  scenario "user posts valid entry" do

    visit "/"
    click_button "New Post"
    expect(page).to have_content "New Post"
    fill_in("Title", with: "Supercalafragelisticexpialidocious: An Analysis")
    fill_in("Description", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.")
    click_button("Submit")
    expect(page).to have_content "Supercalafragelisticexpialidocious"
    expect(page).to have_content "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam."
  end

  scenario "user fails to provide valid title" do

    visit "/"
    click_button "New Post"
    expect(page).to have_content "New Post"
    fill_in("Title", with: "Super!")
    fill_in("Description", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.")
    click_button("Submit")
    expect(page).to have_content "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
  end

  scenario "user fails to provide valid description" do

    visit "/"
    click_button "New Post"
    expect(page).to have_content "New Post"
    fill_in("Title", with: "Supercalafragelisticexpialidocious: An Analysis")
    fill_in("Description", with: "Lorem ipsum dolor sit amet.")
    click_button("Submit")
    expect(page).to have_content "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
  end
end
