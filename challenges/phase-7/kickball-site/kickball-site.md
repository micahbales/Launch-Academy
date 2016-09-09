You have been commissioned by the premier League of Cool Kickball Professionals (LACKP) to build their first website. Lucky you!

### Learning Objectives

* Build a Sinatra application to serve dynamically generated HTML.
* Extract information from a JSON data source.

### Instructions

The league currently has 4 teams. We have supplied a JSON file containing the roster.

The application should satisfy the following user stories:

```no-highlight
As a Kickball Fan
I want to view a page with the names of each team
So that I can learn which teams are in the league
```

Acceptance Criteria:

* When I visit `/teams` I should be able to see list of all the team names

```no-highlight
As a Kickball Fan
I want to view the professional teams
So that I can learn more about the players
```

Acceptance Criteria:

* I can navigate to a distinct url and web page for each team
* Each team page displays the team's name
* Each team page displays each player's name along with their position
* Given that I am on the `/teams` page, I can get to this page by clicking on the name of the team

### Tips

* There are some spec files available to help drive your code through Test Driven Development! Feel free to write some tests to help with the assignment, but they are no required.

* In order to visit a specific team's page, you can utilize the `params` hash to tell your `app.rb` file which team page to visit. Your app, however, should only have one generic path, `/team/:team_name` or `/team/:team` to access any team's show page.

### Optional Challenges
#### Implement features that satisfy the following user stories

```no-highlight
As a Kickball Fan
I want to view a page with the names of each position
So that I can learn what positions there are on a team
```

Acceptance Criteria:

* When I visit `/positions` I should be able to see list of all the positions.

```no-highlight
As a Kickball Fan
I want to see all players in a certain position
So that I can see who plays each position in the league
```

Acceptance Criteria:

* I can navigate to a distinct url for each position
* Each position page displays the position
* Each position page lists each player in that position along with their team name
* Given that I am on the `/positions` page, I can get to this page by clicking on the name of the position

#### Create and utilize objects

Write unit tests for the following classes and implement them

##### `Player` class
* `Player` objects should be initialized with a `name`, `position`, and a `team_name`. These attributes should have reader methods associated with them.
* The `Player` class should have a class method called `all`. This method should return an array of `Player` objects that correspond to every player.

##### `Team` class
* `Team` objects should be initialized with a `name`. This attribute should have a reader method associated with it.
* It should have a class method called `all`. This method should return an array of `Team` objects that correspond to every single team.
* It should have an instance method called `players`. This method should return an array of `Player` objects that correspond to every player of that particular team.

Once you have succesfully implemented these classes, you should utilize them in your app. For example, in your `/teams` route, you can set `@teams = Team.all`, and so you can iterate through the `@teams` array in your view and display each team name.
