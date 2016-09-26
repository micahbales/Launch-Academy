### Introduction

The NFL is trying to make a hip, lean, up-to-date-with-a-vengeance web stack...
and, as a result, they're switching to Javascript. Can you help them again?

The NFL has tasked you with building a program that tracks game results as the
season progresses. In this assignment, you will build a JS application that
prints a leaderboard when your code runs. (For the non-sports fans, a
leaderboard is a scoreboard that shows the name, number of wins, and number of
losses for each team in the league.) First, define a constructor in JS that
returns an object with the following properties:

- Name
- Rank (based on wins)
- Wins (total number of wins)
- Losses (total number of losses)

Using the data defined in `leaderboard.js`, create an array containing
these objects. Then, iterate through the array and output the following to the
console: team name, number of wins, and number of losses. Teams should be
ordered by rank (teams with more wins are ranked and listed higher, teams with
the same numbers of wins can be ranked in any order!).

### Getting Started

```no-highlight
$ cd ~/challenges
$ et get leaderboard-js
$ cd leaderboard-js
$ open SpecRunner.html
```

Then, open up the JavaScript console in your browser.

### Tips

- Output to the console using the `console.log` statement.
- Iterate through `gameInfo` to create team objects with only their names.
- Iterate through `gameInfo` again to set the number of wins and losses for each
  team.
- Finally, sort your team by wins and set their ranks before outputting the
  leaderboard stats.
- Focus on organizing your code well. Separate code into multiple files, as
  necessary.
- Run your code with `node leaderboard.js`

### Stretch Goal #1: Make it Pretty!

Format your output such that your leaderboard prints looking (at least
approximately) like this:

```
--------------------------------------------------
| Name      Rank      Total Wins    Total Losses |
| Patriots  1         3             0            |
| Broncos   2         1             1            |
| Colts     3         0             2            |
| Steelers  4         0             1            |
--------------------------------------------------
```

### Stretch Goal #2: Retrieving More Data

Write a function for the 'Team' object named `summary` that prints the following
information:

- Team's name
- Team's rank
- Team's total number of wins and losses
- Details of each game the team has played (including the name of the opposing
  team and the score for each team)

### Stretch Goal #3: Write Tests!

Using your knowledge of testing with the
[Jasmine framework](http://jasmine.github.io/),
write tests for your Javascript objects.
