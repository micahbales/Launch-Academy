require "spec_helper"

# As a user
# I want to see the members of each project
# So I know who is working on the project
# Acceptance Criteria:
#
# On a project's show page, I should see the first name, last name,
# and email (if any) of each user who is working on the project.

feature "user views project members on project show page" do

  let(:project1) { Project.create(name: "My favorite project", description: "It's quite fun.") }
  let(:project2) { Project.create(name: "My second favorite project") }
  let(:project3) { Project.create(name: "My least favorite project", description: "Not so great.") }

  let(:user1) { User.create(first_name: "Jim", last_name: "Gallagher", email: "jg@ogs.org") }
  let(:user2) { User.create(first_name: "Jane", last_name: "Valasquez") }
  let(:user3) { User.create(first_name: "Mary", last_name: "Contrary", email: "mary@contrary.com") }

  let!(:userproject1) { UserProject.create(user: user1, project: project2) }
  let!(:userproject2) { UserProject.create(user: user2 , project: project1) }
  let!(:userproject3) { UserProject.create(user: user3, project: project3) }
  let!(:userproject4) { UserProject.create(user: user1, project: project3) }
  let!(:userproject5) { UserProject.create(user: user2, project: project3) }
  let!(:userproject6) { UserProject.create(user: user3, project: project1) }

  scenario "user sees first, last name, and email (if applicable)" do
    visit "/projects"
    click_link "My favorite project"
    expect(page).to have_content "Mary Contrary (mary@contrary.com)"
    expect(page).to have_content "Jane Valasquez"
    expect(page).to_not have_content "Jane Valasquez ("
  end
end
