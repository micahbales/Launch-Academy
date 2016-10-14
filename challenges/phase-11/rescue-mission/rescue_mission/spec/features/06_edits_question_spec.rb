require 'rails_helper'

# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

feature "user edits question" do

  let!(:post1) { Post.create(title: "Problems setting up Node.js server - let's just make sure this title is long enough pass validation", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment1) { Comment.create(description: "I enjoy ham sandwiches, when the weather is not too cold.", post_id: post1.id) }

  scenario "successfully edits question" do

    visit "/posts/#{post1.id}"
    click_link "Edit Post"
    expect(page).to have_content "Edit Post: #{post1.title}"
    fill_in("Title", with: "I have no problems setting up my Node.js server - and I know this new title will also pass validation!")
    fill_in("Description", with: "I stopped thinking about ham sandwiches and instead spent my time practicing with Nodeschool. Worked like a charm.")
    click_button("Submit")
    expect(page).to have_content "I have no problems setting up my Node.js server - and I know this new title will also pass validation!"
  end

  scenario "fails to provide valid title" do
    visit "/posts/#{post1.id}"
    click_link "Edit Post"
    expect(page).to have_content "Edit Post: #{post1.title}"
    fill_in("Title", with: "Yo.")
    fill_in("Description", with: "I stopped thinking about ham sandwiches and instead spent my time practicing with Nodeschool. Worked like a charm.")
    click_button("Submit")
    expect(page).to have_content "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
  end

  scenario "fails to provide valid description" do
    visit "/posts/#{post1.id}"
    click_link "Edit Post"
    expect(page).to have_content "Edit Post: #{post1.title}"
    fill_in("Title", with: "I have no problems setting up my Node.js server - and I know this new title will also pass validation!")
    fill_in("Description", with: "HAM. SANDWICH.")
    click_button("Submit")
    expect(page).to have_content "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
  end
end
