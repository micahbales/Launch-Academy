# Game Collector

A Rails application that tracks users and their board game collections.


## ER Diagram

```
  +--------------+                                   +------------+
  |  BoardGames  |     +-----------------------+     |   Users    |
  +--------------+     |  BoardGameCollection  |     +------------+
  | name         |     +-----------------------+     | first_name |
  | publisher    |    /| user_id               |\    | last_name  |
  | description  +-----+ board_game_id         +-----+ email      |
  | release_date |    \|                       |/    | role       |
  |              |     +-----------------------+     |            |
  +--------------+                                   +------------+
```
created with [asciiflow](http://asciiflow.com/)

## User Stories

### Input a Board Game
```
As a 7th Level Dungeon Master
I want to save the details of a board game that I own
So that I can have a digital record of it.
```

#### Acceptance Criteria
- [ ] I must enter a name, publisher, description, and release_date
- [ ] If all fields are complete, I am told that my board game has been saved
- [ ] If a field is incomplete, I am given an error message and brought back to the input form.
- [ ] If a board game already exists in the database, I am given an error message.

### View a List of Board Games
```
As a visitor of the Game Collector website
I want to see a list of board games
So that I can learn about awesome games.
```

#### Acceptance Criteria
- [ ] If I navigate to the /board_games path, I should see a list of games.

### User Sign Up
```
As a Board Game Fanboy (or Fangirl)
I want to sign up for the Game Collector application
So that I can use all of its awesome features.
```

#### Acceptance Criteria
- [ ] There is a link to 'Sign Up' on the homepage.
- [ ] If I fill in my first name, last name, email, password, and password confirmation correctly, I am greeted with a confirmation message that my account has been created.
- [ ] If the password and password confirmation fields do not match, I am given an error message.
- [ ] If my email already exists in the database, I am given a message that tells me I have already registered.
- [ ] If my email is not formatted correctly, I am given an error message.

### User Sign In
```
As a Officially Registered Game Collector user
I want to sign in
So that I can see my digital collection of board games.
```

#### Acceptance Criteria
- [ ] There is a link to 'Sign In' on the homepage.
- [ ] If I fill in my email and password correctly, I am greeted and redirected to my board game collection.
- [ ] If I input my password incorrectly, I am given an error message.
- [ ] If I am signed in, I should not see a link to 'Sign Up'.

### View the Details of a Board Game
```
As a visitor of the Game Collector website
I want to see the details of a board game
So that I can find out what I want to purchase next.
```

#### Acceptance Criteria
- [ ] From the board games index page, I should be able to click on a link for a board game.
- [ ] I should see the name, publisher, description, and release date of the board game.

### Add a Board Game to My Collection
```
As a Board Game Collector
I want to add a board game to my collection
So that I can bask in the glory of my collection.
```

#### Acceptance Criteria
- [ ] From the show page for a board game, if a game isn't in my collection, I should see a button to 'add to collection'.
- [ ] When I add a game to my collection, I should receive a message saying that the board game was added.
- [ ] From the homepage, I should see a link to 'My Collection' which shows me all the board games in my collection.
- [ ] If the game is in my collection, I should see a message on the board game show page that says: 'collected'.


### Admin Views a List of Users
```
As an administrator of the Game Collector Website
I want to see a list of users and email addresses
So that I can view who is using my website.
```

#### Acceptance Criteria
- [ ] I can see a link to view a list of users from the homepage
- [ ] The page should contain the user's full name, email address, role, and the number of board games in their collection.
- [ ] If I am not an administrator, I should be redirected to the homepage.
