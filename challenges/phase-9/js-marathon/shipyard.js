function launchpad(ship, crew, rocket) {
  console.log("Roger, " + ship.name + ". Completing inertial measurement unit preflight alignments");
  console.log("Confirmed: " + crewMembers[ourShip.captain()].name + " will be captain of the " + ship.name + " for this flight!");
  loadCrew = ship.loadCrew(crew);
  mountPropulsion = ship.mountPropulsion(rocket);
  console.log(rocket.name + " has been mounted to the " + ship.name + ". Stand by for ignition.")
  ship.addFuel();
  ship.takeoff();
  ship.rollprogram();
};

function Ship(name) {
  this.name = name;
  this.crew = [];
  this.loadCrew = function(crew) {
    for (var i = 0; i < crew.length; i++) {
      this.crew.push(crew[i]);
      console.log(crew[i].name + " has boarded the " + this.name + "!")
    }
  };
  this.captain = function() {
    var number = 4
    var randomNumber = Math.floor(Math.random() * number);
    return randomNumber;
  }
  this.propulsion = null;
  this.mountPropulsion = function(rocket) {
    this.propulsion = rocket;
    console.log("Propulsion mounted!")
  };
  this.takeoff = function() {
    launched = this.propulsion.fire();
    if (launched) {
      console.log("BRRRRRRRRRROOOOOOMMMMMMM!!!!");
    } else {
      console.log("Takeoff unsuccessful.");
    }
  };
  this.addFuel = function() {
    this.propulsion.fuel = 10;
    console.log("Fuel added. Ready for launch!");
  }
  this.rollprogram = function() {
    console.log("Tower cleared. Roll program.");
  };
};

var ourShip = new Ship("Navigator");

var crewNames = ["Micah", "Jonathan", "Michael", "Darlene"];

function Crewmember(name) {
  this.name = name;
  this.trained = false;
};

function trainCrew(crewNames) {
  var crewMembers = [];
  for (var i = 0; i < crewNames.length; i++) {
    crewMember = new Crewmember(crewNames[i]);
    crewMember.trained = true;
    crewMembers.push(crewMember);
  }
  return crewMembers;
};

var rocket1 = {
  name: "External Tank",
  fuel : 0,
  addFuel : function(int) {
    fuel += int;
  },
  fire : function(){
    if (this.fuel > 0) {
      this.fuel -= 1;
      console.log("Liftoff! We have lift off!!");
      return true;
    } else {
      console.log("The fuel gauge reads '0' - we need more fuel!");
      return false;
    }
  }
};

function Fleet() {
  this.ships = [];
}

shuttleFleet = new Fleet;
shuttleNames = ["Atlantis", "Challenger", "Columbia", "Enterprise", "Discovery"];
for (var i = 0; i < shuttleNames.length; i++) {
  shuttleFleet.ships.push(new Ship(shuttleNames[i]));
}

var crewMembers = trainCrew(crewNames);
launchpad(shuttleFleet.ships[0], crewMembers, rocket1);
