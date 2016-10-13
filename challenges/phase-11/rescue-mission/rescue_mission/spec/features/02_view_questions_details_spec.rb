require 'rails_helper'

# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description

feature "user views post description via link from index" do

  let!(:post1) { Post.create(title: "Problems setting up Node.js server - Is this title long enough now?", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:post2) { Post.create(title: "How does this eRuby thing work, anyway? Let's take a deeper look", description: "Maecenas congue molestie velit in egestas. Donec gravida ex quis odio placerat placerat. Pellentesque a velit accumsan, cursus urna in, fermentum sem.") }

  scenario "views description link" do

    visit "/"
    expect(page).to have_link "How does this eRuby thing work, anyway?"
  end

  scenario "clicks link to view description on show page" do

    visit "/"
    first(:link, "How does this eRuby thing work, anyway?").click
    expect(page).to have_content "How does this eRuby thing work, anyway?"
    expect(page).to_not have_content "Problems setting up Node.js server"
    expect(page).to have_content "Maecenas congue molestie velit in egestas. Donec gravida ex quis odio placerat placerat. Pellentesque a velit accumsan, cursus urna in, fermentum sem."
  end
end
