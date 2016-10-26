### Introduction

In this challenge you'll be building a full-fledged web application from scratch.  The application should allow users to add new items and write reviews for those items. The item for review can be any entity of your choosing (e.g. a review site for restaurants, food trucks, playlists, other review sites, etc.).

Your site will be described as a series of user stories. You'll be expected to
write user stories and formulate acceptance criteria, write tests to reflect
those criteria, and then write code to build out that functionality and get the
tests to pass.

The purpose of this project is two-fold:

1. To touch on several of the key features of basic Rails apps, such as authorization and search.
2. To learn how to build an app and use proper TDD and git workflows.

### Setting Expectations

This project ties together most of the core skills and technologies that you have learned to date. The scope and nature of this challenge is designed to simulate aspects of the web developer workflow experience. As such, __managing__ workflow, timelines and expectations is equally important - even if you are working on your own.

Most real-world projects are large, evolving, ongoing bodies of work. They are **not** intended to be completed in a single sitting, never to be touched again. In the same way, you should view this as an ongoing project that you spend quite a few working sessions on. During each session, plan to make incremental progress on a feature or two.

Taking your time and pacing your work, this challenge may span a couple weeks - and that's completely normal. Do not rush through the assignment, as this is an opportunity to practice TDD and refine your git workflows, which are extremely practical skills for the professional software developer.

### Requirements

At a minimum, you must supply the following functionality:

* The ability to add an item to be reviewed.
* The ability to rate (score on a scale) the item and to optionally comment on it (i.e. write a review).
* The ability to upvote or downvote a review. A user can only upvote or downvote once and can change their vote from up to down. This feature should utilize AJAX (and an internal Rails API endpoint) so that a complete page reload isn't necessary.
* A sign up and authentication system for your users (with Devise).
* The ability to search for items.
* An admin role. Admins are able to delete reviews or items if they are deemed to be inappropriate.

Each of these features will be described in more detail below, but many of them will require you to do some independent research - read gem documentation, watch RailsCasts, etc. Embrace the challenge! You'll need those research skills as a developer long after Launch Academy.

### Getting Started Checklist

* Decide what kind of review site you'll be making together. Feel free to ask
  other students or your mentor if you have questions about the review app you
  want to build.
* Create an ER Diagram and user stories for your first two features
* Create your new rails app, directions below
* Create a repository on Github, add your mentor to it, and push your starting
  code ("initial commit") up on the remote repo
* Plan out your organizational approach for the app requirements (making a
  Trello board, or Pivotal Tracker if desired, etc.)

### Create a New Rails Application

Create a new rails app with postgres and rspec with the following steps:
- Create a empty directory with your app name
- Run this in the root of that directory: `rails new . --database=postgresql --skip-turbolinks --skip-test-unit -T` && `bundle`
- `rake db:create`
- Be sure you have the following gems in the Gemfile:

Note: the `rails new` generated gemfile has many commented lines/gems. You can
always get these back by `rails new'ing` a new project and lookin at that
projects gemfile so its much cleaner to delete all these commented lines of code
after you've created your Gemfile.  

```ruby
gem 'foundation-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
end
```

- `bundle` the new added gems and install rspec `rails generate rspec:install`

### User Authentication

Very often, the first place we'll start when writing an app is the `User` model.
Most of our apps will require users to create accounts and login to access many
of the key features.

#### Authentication Implementation

In Rails, we can use a gem called
[Devise](https://github.com/plataformatec/devise) to create our `User` model for
us.  It takes care of user authentication, security, forgotten passwords, and
the like.  Devise is widely used and well-tested, so we shouldn't need to worry
about the security of our users' data.

Get started adding devise by following the Devise guides
[here](https://github.com/plataformatec/devise#getting-started).

#### Authentication User Stories

Your implementation should fulfill the following user stories, add the necessary
acceptance tests to be sure functionality is always working properly:

```no-highlight
As a prospective user
I want to create an account
So that I can post items and review them
```

```no-highlight
As an unauthenticated user
I want to sign in
So that I can post items and review them
```

```no-highlight
As an authenticated user
I want to sign out
So that no one else can post items or reviews on my behalf
```

```no-highlight
As an authenticated user
I want to update my information
So that I can keep my profile up to date
```

```no-highlight
As an authenticated user
I want to delete my account
So that my information is no longer retained by the app
```

### CRUD Behavior

Now that we have users, it's time to add the item we want to review. We'll want
to write user stories for each CRUD action that we want to complete for a
review.

CRUD is an acronym representing the major database operations we might want to
perform for a particular model.  It stands for:

* Create  (add a record to the databse)(A user adds an item to the database)
* Read (retrieve information about items from the database)(A user views a list
  of items, or the page for a particular item)
* Update (edit an item's information) (A user edits an item's information)
* Delete (delete an item from the database)(A user deletes an item)

#### CRUD User Stories

In a standard CRUD app, each of these CRUD operations will correspond to one
(or, for "read", two) user stories:

* Create

```no-highlight
As an authenticated user
I want to add an item
So that others can review it
```

* Read

```no-highlight
As an authenticated user
I want to view a list of items
So that I can pick items to review
```

```no-highlight
As an authenticated user
I want to view the details about an item
So that I can get more information about it
```

* Update

```no-highlight
As an authenticated user
I want to update an item's information
So that I can correct errors or provide new information
```

* Delete

```no-highlight
As an authenticated user
I want to delete an item
So that no one can review it
```

**Note:** You may decide that you want certain features (such as viewing a list
of items) to be available to unauthenticated users, or non-users who visit the
site.  In that case, you can modify the first line of the relevant user story to
reflect that.

#### CRUD Implementation

Complete the CRUD user stories for the item you want to review.

#### Modify the User Stories

Tailor the user stories above to suit your app and add acceptance criteria to
further guide your implementation.

Acceptance criteria should specify the following, at a minimum:

* What conditions must be met for the task to be completed.
  * Ex. "I must be logged in to add an item."
* Which fields are required.
  * Ex. "I must provide an item name and description."
* Which fields are optional.
  * Ex. "I may optionally provide the item's website."
* What happens in the case of an error.
  * Ex. "If I do not supply the required information, I receive an error message."
  * Ex. "If an item with that name is already in the database, I receive an error message."

#### Create a New Feature Branch

Create a new branch prefixed with your initials, for example:

```no-highlight
$ git branch hh-fs-add-<item_name>-model
```

#### Write an Acceptance Test

Before you begin your implementation for each user story, write an acceptance
test for it.

#### Create a Pull Request

Push up your branch to GitHub and create a Pull Request. Consult your Mentor or
other students if you need guidance on how to create a Pull Request.

### Continuous Delivery

While developing your review site, you should practice [continuous
delivery](https://en.wikipedia.org/wiki/Continuous_delivery). This means, that
after a feature is complete, and the test suite passes, the app should be
deployed to production for the world to see.

The master branch of your project should be treated as a sacred place: A place
where only finished and tested code shall live. If you adheres to this mantra,
and code branches are not prematurely merged into master, the master branch can
be deployed to production at any time, with little worry of failure.

We will use Heroku as our production environment to serve our application to
users. See the [Getting Started with Rails
4](https://devcenter.heroku.com/articles/getting-started-with-rails4)
documentation on Heroku for instructions on getting your Rails app live on the
Internets.

### Reviewing Items

Using the examples in the last assignment, write user stories and acceptance
criteria for reviews.

Your user stories should cover:

* A user adding a review
* A user viewing a list of reviews for an item
* A user updating a review
* A user deleting a review

Before writing any code for this feature, create a new branch in your
repository. Then write an acceptance test for the review functionality before
implementing it.

Once the feature is complete, open a pull request on GitHub to merge it back
into master after carefuly reviewing your code.


```ruby
review = Review.first
review.item # this will break without an Item model
```

Instead, we can leave off our association and include an `item_name` field on
our `reviews` table instead of an `item_id` foreign key.  Once the items Pull
Request has been merged into master, you can update your acceptance tests,
change the `item_name` column to a foreign key, and add the association.

### Voting

Now that we've got items and reviews, it's time to let users vote on reviews.

Write user stories and acceptance criteria to cover the following situations:

* A user votes on a review
* A user changes their vote
* A user deletes their vote

Make sure a user can only vote once per review.

This feature should be implemented using AJAX so that a complete page reload is not required. Your AJAX call should communicate with an internal Rails API endpoint that you create.

**DO NOT USE** the `act_as_votable` gem to implement this feature. As before,
start by checking out a new feature branch.  Write a controller test, make the
test pass, and repeat until your user stories are complete.  Create a Pull
Request containing your completed code.

### Administrators

Many web apps have separate admin sections that allow admins to perform tasks
that regular users cannot. Let's give admins the ability to delete inappropriate
items or reviews, or obnoxious users' accounts.

Write user stories and acceptance criteria to cover the following situations:

* An admin views a list of users
* An admin deletes a user
* An admin deletes an item
* An admin deletes a review

Follow the git and TDD workflow you've established when completing prior features.

#### Hints

There are two general approaches to implementing admin functionality: add
conditional statements to existing views and controllers to check for admin
privileges or define a separate set of views/controllers only accessible to
admins.

Adding conditional checks for admins to existing views may look something like:

```html
<% @items.each do |item| %>
  <!-- some stuff here -->

  <% if current_user.admin? %>
    <%= button_to 'Delete', item, method: :delete %>
  <% end %>
<% end %>
```

Merely hiding a button or creating a separate view does not prevent malicious
users from performing admin-only actions, such as triggering our
`ItemsController#destroy` action. Malicious users could still delete records by
sending hand-crafted HTTP requests to delete the record directly. Ensure that
you have the appropriate checks in your controller to ensure that the
authenticated user has the appropriate permissions to perform certain actions.

An alternative is to using **namespacing** to define a set of routes and
controllers that are only accessible to admin users:

```ruby
namespace :admin do
  resources :items
end
```

With separate controllers and views you can simplify the authorization checks by
only allowing admins to view any portion of the page.

### Search

Add a search bar that allows users to search for items.

Write a user story and acceptance criteria for this feature.

Take some time to try to figure out how to do this on your own.

If you're stuck, consult past Sinatra apps that had search functionality, or
[this Railscast](http://railscasts.com/episodes/37-simple-search-form) or [this
blog article](http://www.stefanosioannou.com/rails-4-simple-search-form/).
