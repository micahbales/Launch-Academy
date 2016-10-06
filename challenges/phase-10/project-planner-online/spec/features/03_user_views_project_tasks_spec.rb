require "spec_helper"

# As a user
# I want to see the tasks of each project
# So I know what needs to completed in the project
# Acceptance Criteria:
#
# On a project's show page, I should see all the name of each
# task as well as the first and last name of the user assigned
# to the task (if there is someone assigned to the task).

feature "on project page, user sees name of each task (and assigned user)" do

  let!(:project1) { Project.create(name: "My favorite project", description: "It's quite fun.") }
  let!(:project2) { Project.create(name: "My second favorite project") }
  let!(:project3) { Project.create(name: "My least favorite project", description: "Not so great.") }

  let!(:user1) { User.create(first_name: "Jim", last_name: "Gallagher", email: "jg@ogs.org") }
  let!(:user2) { User.create(first_name: "Jane", last_name: "Valasquez") }
  let!(:user3) { User.create(first_name: "Mary", last_name: "Contrary", email: "mary@contrary.com") }

  let!(:userproject1) { UserProject.create(user: user1, project: project2) }
  let!(:userproject2) { UserProject.create(user: user2 , project: project1) }
  let!(:userproject3) { UserProject.create(user: user3, project: project3) }
  let!(:userproject4) { UserProject.create(user: user1, project: project3) }
  let!(:userproject5) { UserProject.create(user: user2, project: project3) }
  let!(:userproject6) { UserProject.create(user: user3, project: project1) }

  let!(:task1) { Task.create(name: "Do dishes", project: project3, user: user1) }
  let!(:task2) { Task.create(name: "Mow lawn", project: project2, user: user3) }
  let!(:task3) { Task.create(name: "Pick flowers", project: project1, user: user2) }
  let!(:task4) { Task.create(name: "Buy groceries", project: project1, user: user2) }
  let!(:task5) { Task.create(name: "Clean bathroom", project: project2) }
  let!(:task6) { Task.create(name: "Eat snack", project: project3, user: user2) }

  scenario "view tasks with users (but not all of them)" do
    visit "/projects"
    click_link "My least favorite project"
    expect(page).to have_content "(Assigned to: Jim Gallagher)"
    expect(page).to have_content "(Assigned to: Jane Valasquez)"
    expect(page).to_not have_content "(Assigned to: Mary Contrary)"
    expect(page).to have_content "Do dishes"
    expect(page).to have_content "Eat snack"
    expect(page).to_not have_content "Buy groceries"
  end
end
