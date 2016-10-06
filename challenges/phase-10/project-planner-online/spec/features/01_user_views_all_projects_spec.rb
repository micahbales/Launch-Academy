require "spec_helper"

# As a user
# I want to view a list of all projects
# So I know what projects are ongoing
# Acceptance Criteria:
#
# On the projects index page, I should see the name of each project.
# On the projects index page, the name of each project should be a link to the project's show page.

feature "user views all projects" do

  let!(:project1) { Project.create(name: "My favorite project", description: "It's quite fun.") }
  let!(:project2) { Project.create(name: "My second favorite project") }
  let!(:project3) { Project.create(name: "My least favorite project", description: "Not so great.") }

  scenario "on index page, see name of each project" do

    visit "/projects"
    expect(page).to have_content "My favorite project"
    expect(page).to have_content "My second favorite project"
    expect(page).to have_content "My least favorite project"
  end

# As a user
# I want to see the details of a project
# So I can learn more about each project
# Acceptance Criteria:
#
# On a project's show page, I should see the name and description (if any) of the project.

  scenario "on index page, name of each project is link to project show page" do

    visit "/projects"
    click_link "My favorite project"
    expect(page).to have_content "It's quite fun."
  end

  scenario "when no description is provided, user encounters default language" do

    visit "/projects"
    click_link "My second favorite project"
    expect(page).to have_content "No description provided."
  end
end
