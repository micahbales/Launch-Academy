require 'rails_helper'

# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly

feature "user adds comment to post" do

  let!(:post1) { Post.create(title: "Problems setting up Node.js server - Is this title long enough now?", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  scenario "provides valid description" do

    visit "/posts/#{post1.id}"
    fill_in("Description", with: "Pellentesque a velit accumsan, cursus urna in, fermentum sem.")
    click_button("Submit")
    expect(page).to have_content "Pellentesque a velit accumsan, cursus urna in, fermentum sem."
  end

  scenario "provides invalid description" do

    visit "/posts/#{post1.id}"
    fill_in("Description", with: "Pellentesque a velit accumsan.")
    click_button("Submit")
    expect(page).to have_content "Comment must include at least 50 characters"
  end
end
