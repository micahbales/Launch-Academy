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

  let!(:post1) { Post.create!(title: "Problems setting up Node.js server - let's make sure this title is long enough to pass muster", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment1) { Comment.create!(description: "I enjoy ham sandwiches, when the weather is not too cold.", post_id: post1.id) }
  let!(:post2) { Post.create!(title: "Another issue that I forgot to mention but which might end up being really important", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment2) { Comment.create!(description: "Really? Ham sandwiches? That's your answer? What is this world coming to!", post_id: post2.id) }

  scenario "visits answers show page" do

    visit "/posts/#{post1.id}"
    expect(page).to have_content "Problems setting up Node.js server - let's make sure this title is long enough to pass muster"
    expect(page).to have_content "I enjoy ham sandwiches, when the weather is not too cold."
    expect(page).to_not have_content "Another issue that I forgot to mention but which might end up being really important"
    expect(page).to_not have_content "Really? Ham sandwiches? That's your answer? What is this world coming to!"
  end
end
