require 'rails_helper'

# As a user
# I want to delete a question
# So that I can delete duplicate questions
#
# Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted

feature "user deletes question" do

  let!(:post1) { Post.create(title: "Problems setting up Node.js server - let's just make sure this title is long enough pass validation", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment1) { Comment.create(description: "I enjoy ham sandwiches, when the weather is not too cold.", post_id: post1.id) }
  let!(:comment2) { Comment.create(description: "Also, I almost forgot to mention - I am a banana. My spoon is too big.", post_id: post1.id) }

  scenario "deletes question from edit page" do

    visit "/posts/#{post1.id}"
    click_link "Edit Post"
    click_button "Delete Post"
    expect(page).to have_content "Stack Underflow"
    expect(page).to have_content "Post has been deleted!"
    expect(page).to_not have_content "Problems setting up Node.js server - let's just make sure this title is long enough pass validation"
  end

  scenario "deletes question from details page" do
    visit "/posts/#{post1.id}"
    click_button "Delete Post"
    expect(page).to have_content "Stack Underflow"
    expect(page).to have_content "Post has been deleted!"
    expect(page).to_not have_content "Problems setting up Node.js server - let's just make sure this title is long enough pass validation"

  end
end
