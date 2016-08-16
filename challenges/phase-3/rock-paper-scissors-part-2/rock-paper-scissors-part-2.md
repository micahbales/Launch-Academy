### Instructions

Write a program where the user can play a game of **Rock, Paper, Scissors** (RPS) against the computer. The winner is determined by the first player to win two rounds.

#### Rules of the Game

Taken from [Wikipedia][wikipedia]:

> Rock-paper-scissors is a hand game usually played by two people, where players simultaneously form one of three shapes with an outstretched hand. The "rock" beats scissors, the "scissors" beat paper and the "paper" beats rock; if both players throw the same shape, the game is tied.

### Requirements

* The user is playing against a computer opponent in Rock, Paper, Scissors.
* A game consists of a series of rounds until either player has won.
* The first player to win two rounds is declared the winner and the game ends.
* The number of rounds won by the player and the computer are shown each round.
* Output the winner of the game before exiting.
* The computer opponent randomly chooses between rock, paper, and scissors each round.
* The user chooses their shape by typing `"r"` (rock), `"p"` (paper), or `"s"` (scissors) each round.
* If the player enters an invalid shape, print an error message and start the next round.
* If both players choose the same shape, it is a tie and no one wins the round.

### Sample Usage

Player wins:

```no-highlight
$ ruby game.rb
Player Score: 0, Computer Score: 0
Choose rock (r), paper (p), or scissors (s): r
Player chose rock.
Computer chose rock.
Tie, choose again.

Player Score: 0, Computer Score: 0
Choose rock (r), paper (p), or scissors (s): s
Player chose scissors.
Computer chose paper.
Scissors beats paper, player wins the round.

Player Score: 1, Computer Score: 0
Choose rock (r), paper (p), or scissors (s): s
Player chose scissors.
Computer chose paper.
Scissors beats paper, player wins the round.

Player wins!
```

Computer wins:

```no-highlight
$ ruby game.rb
Player Score: 0, Computer Score: 0
Choose rock (r), paper (p), or scissors (s): s
Player chose scissors.
Computer chose rock.
Rock beats scissors, computer wins the round.

Player Score: 0, Computer Score: 1
Choose rock (r), paper (p), or scissors (s): r
Player chose rock.
Computer chose paper.
Paper beats rock, computer wins the round.

Computer wins!
```

Invalid input:

```no-highlight
Player Score: 0, Computer Score: 0
Choose rock (r), paper (p), or scissors (s): b
Invalid entry, try again.
```

### Tips

* Use your submission for the first Rock Paper Scissors challenge as a starting point.
* Incorporate your knowledge of looping, iteration, flow-control,
  and data structures to make the required changes.

[wikipedia]: http://en.wikipedia.org/wiki/Rock-paper-scissors
