function getTeamNames(gameData) {
  var teamNames = [];
  for (var i = 0; i < gameData.length; i++) {
    if (teamNames.indexOf(gameData[i].home_team) === -1) {
      teamNames.push(gameData[i].home_team);
    }
    if (teamNames.indexOf(gameData[i].away_team) === -1) {
      teamNames.push(gameData[i].away_team);
    }
  }
  return teamNames;
};

function createTeamObjects(teamNames) {
  var teamObjects = []
  for (var i = 0; i < teamNames.length; i++) {
    teamObjects.push(new Team(teamNames[i]));
  }
  return teamObjects;
};

function findWinsLosses(teams, gameData) {

  for (var i = 0; i < gameData.length; i++) {

    var home_team = gameData[i]["home_team"];
    var away_team = gameData[i]["away_team"];
    var home_score = gameData[i]["home_score"];
    var away_score = gameData[i]["away_score"];

    for (var j = 0; j < teams.length; j++) {
// array.find()
      if (home_score > away_score) {
        if (teams[j].name === home_team) {
          teams[j].wins += 1;
        } else if (teams[j].name === away_team) {
          teams[j].losses += 1;
        }
      } else if (home_score < away_score) {
        if (teams[j].name === away_team) {
          teams[j].wins += 1;
        } else if (teams[j].name === home_team) {
          teams[j].losses += 1;
        }
      }

    }
  }
};

function rankTeams(teams) {

  teams = teams.sort(function(a,b) {
    if ((a.wins - a.losses) > (b.wins - b.losses)) {
      return -1;
    } else if ((a.wins - a.losses) < (b.wins - b.losses)) {
      return 1;
    } else {
      return 0;
    }
  });

  for (var i = 0; i < teams.length; i++) {

    teams[i].rank = i + 1;
  }

  return teams;
}

function getMyTeams(gameData) {

  var teamNames = getTeamNames(gameData);
  var teams = createTeamObjects(teamNames);
  findWinsLosses(teams, gameData);
  rankTeams(teams);
  return teams;
};

function outputTeamData(myTeams) {
  console.log("--------------------------------------------------");
  console.log("| Name      Rank      Total Wins    Total Losses |");
  for (var i = 0; i < myTeams.length; i++) {
    console.log("| " + myTeams[i].name + "    "
    +  i + "      " + "      " + myTeams[i].wins + "          " + myTeams[i].losses + "           | \b");
  }
  console.log("--------------------------------------------------");
};
