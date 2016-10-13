require 'rails_helper'

# As a user
# I want to view the answers for a question
# So that I can learn from the answer
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must only see answers to the question I'm viewing
# - I must see all answers listed in order, most recent last

feature "user views answers" do

  let!(:post1) { Post.create(title: "Problems setting up Node.js server", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment1) { Comment.create(content: "I enjoy ham sandwiches, when the weather is not too cold.", post_id: post1.id) }

  xscenario "visits answers show page" do

    visit "/posts/#{post1}"
    click_link "View answers"
    expect(page).to have_content "Answers to Problems setting up Node.js server"
    expect(page).to have_content "I enjoy ham sandwiches, when the weather is not too cold."
  end
end
