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

  let!(:post1) { Post.create(title: "Problems setting up Node.js server", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment1) { Comment.create(content: "I enjoy ham sandwiches, when the weather is not too cold.", post_id: post1.id) }

  xscenario "successfully edits question" do

    visit "/posts/#{post1}"
    click_link "Edit Question"
    expect(page).to have_content "Edit Question: #{post1.title}"
    fill_in("title", with: "I have no problems setting up my Node.js server!")
    fill_in("description", with: "I stopped thinking about ham sandwiches and instead spent my time practicing with Nodeschool. Worked like a charm.")
    click_button("Submit")
    expect(page).to have_content "I have no problems setting up my Node.js server!"
  end

  xscenario "fails to provide valid title" do
    visit "/posts/#{post1}"
    click_link "Edit Question"
    expect(page).to have_content "Edit Question: #{post1.title}"
    fill_in("title", with: "Yo.")
    fill_in("description", with: "I stopped thinking about ham sandwiches and instead spent my time practicing with Nodeschool. Worked like a charm.")
    click_button("Submit")
    expect(page).to have_content "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
  end

  xscenario "fails to provide valid description" do
    visit "/posts/#{post1}"
    click_link "Edit Question"
    expect(page).to have_content "Edit Question: #{post1.title}"
    fill_in("title", with: "I have no problems setting up my Node.js server!")
    fill_in("description", with: "HAM. SANDWICH.")
    click_button("Submit")
    expect(page).to have_content "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
  end
end
