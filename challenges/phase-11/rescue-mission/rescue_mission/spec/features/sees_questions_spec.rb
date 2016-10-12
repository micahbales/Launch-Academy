require 'rails_helper'

# As a user
# I want to view recently posted questions
# So that I can help others
#
# Acceptance Criteria
#
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

feature "user sees title of each question" do

  let!(:post1) { Post.create(title: "Problems setting up Node.js server", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:post2) { Post.create(title: "How does this eRuby thing work, anyway?", description: "r") }


  scenario "views questions" do
    visit "/"
    expect(page).to have_content "Problems setting up Node.js server"
    expect(page).to have_content "How does this eRuby thing work, anyway?"
  end

end
