function Team(name, rank, wins, losses) {
  this.name = name;
  this.rank = rank || 0;
  this.wins = wins || 0;
  this.losses = losses || 0;
  this.summary = function() {
    console.log("The " + this.name + " won " + this.wins + " and lost " + this.losses + ".")
  }
};
