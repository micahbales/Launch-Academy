# The Final Frontier

It's time to explore space! But first, we've got to work together and build a spaceship that will get us there!

We've provided a `shipyard.js` file that we're going to use to build our ship, our rockets, our crew, and blast off.

#### Step 0 - Create a launchpad

We need a launchpad from which we can launch our spaceship!

Create a function called `launchpad`.
Inside of the function write a short message announcing the initiation of preflight procedures - any string of text that you and your group agree on!
This message should be outputted to the browser's developer tools console.

Then call `launchpad` at the end of the file.
We can run the code by going to the terminal and typing `node shipyard.js`.
You should see your preflight message!

After each step, we should run `node shipyard.js` to make sure our code works, and is printing what we expect.

#### Step 1 - Build a spaceship!

Let's start building our space vessel!

Create a Javascript function called `Ship` that is a constructor that takes a `name` argument and assigns it to a `name` property. Using that constructor, make a new object and name it `ourShip`.
Discuss with your group what an appropriate name for this ship might be.

Let's add another preflight message that announces the name of our ship in our `launchpad` function.
We'll need to add an argument to the `launchpad` function so we can pass in `ourShip`.

#### Step 2 - Round up your crew!

We're going to work on getting our crew on the ship - but first we need to round them up!

First create an array named `crewNames`, and fill it with the name of all the members in your mentor group!

Make a constructor function for a `CrewMember` that takes a `name` argument and assigns it to a `name` property. Also make a `trained` property that defaults to false.


#### Step 3 - Train your crew!

We're going to create a function called `trainCrew` that takes in an array of strings (the names of each crew member) and returns an array of Javascript objects (a CrewMember object).
The trainCrew function should also change their `trained` attribute to true.

Finish by creating an array of crew member objects called `crewMembers` by using both the `crewNames` array and the `trainCrew` function.

#### Step 4 - Board the ship!

Time to get our crew onboard the ship!

Let's add a `crew` property to the `Ship` constructor with a default value of an empty array.

Next, let's create a `loadCrew` property on the ship's prototype with an anonymous function as a value.
This anonymous function should take in an array of crew member objects and one by one it should:

* Add them to the ship's `crew` array.
* Output a message announcing the name of the crew member that has boarded the ship.

Let's make loading the crew part of the `launchpad` function. We're going to add another argument to `launchpad` to accept the `crewMembers` array.
Finally, lets call the ship's `loadCrew` function with the `crewMembers` array in the `launchpad` function.

#### Step 5 - Random captain!

The crew decided to take turns playing the role of captain of the ship. Every time we ask the ship who is the captain, we're going to get a random crewMate!

Start by defining the `captain` function on the `ship` prototype.
This function will randomly pick a member from the ship's `crew` array.
But, how do we implement randomness in javascript? Take a look at the following code for some inspiration!

```
var number = 3;
var random_number = Math.floor(Math.random() * number);
console.log(random_number);
// Outpus either 0, 1, or 2 to the browser's console.
```

#### Step 6 - Pick the captain!

Once the `captain` function has been implemented, let's add another preflight message to the the launchpad, so that we can announce the captain of this particular launch.

Be sure to check how the code looks by running `node shipyard.js`, then give our first captain a high-five.

#### Step 7 - Building your spaceship's rockets!

Earth's gravity well is no small task to overcome. We're going to need some sturdy rockets to take us to the stars.

Create a `rocket` object (which we will later mount to our ship for propulsion) via an object literal, and assign it two properties:
 1. `fuel` which will default to `0`.
 2. `addFuel` which will be a function that accepts an integer as an argument, adds it to the rocket's fuel, and prints out the new fuel amount.


#### Step 8 - Define a rocket's fire function!

Now, we're going to write some code to fire the engines!
We want to make sure there is fuel in the tank, and if there is, we want to print that the rockets fired and remove some fuel.

Our `fire` function needs to:
* Check and see if there is fuel in the `fuel` property.
* If there is, subtract 1 from the `fuel` property, print that the engines have been fired, print the rocket's current fuel count, and return true.
* If there is not, print that the engines failed to fire and return false.

We're almost there!

#### Step 9 - Mount your rocket!

To start off, let's add a property to the `Ship` constructor called `propulsion` which is set initially to `null`.

We're going to write some cool functions on the `Ship` prototype to attach our rocket.

Add another property to the `Ship` prototype called `mountPropulsion`, this is going to be a function that takes in an object and assigns it to the ship's `propulsion` property.
It should also print out that the propulsion mounted!

Finish by passing in our `rocket` to the `launchpad` function. In the `launchpad` function, mount the rocket to ourShip!

#### Step 10 - Blast off!

We've got all of our pieces together. Now we've got to blastoff!

Let's add a `takeoff` function on the `ship` prototype that:
* `fire`s the propulsion drives.
* If the engines successfully fire, print a really convincing takeoff noise.
* If the engines fail to fire, print that takeoff was unsuccessful.

Once you are done, call the `takeoff` function in the launchpad function and take off!!

Oh snap, did you forget to fuel up your rocket??? If you need to add fuel to your rocket, add that to your launchpad function!


#### Step 11 - Build a fleet!

You just got called up the big leagues as an Admiral of a Fleet!  Make a `fleet` object that has a property of `ships` defaulted to an empty array and property of name of your choosing.  Add a function to the `fleet` object, called `build` that takes in an array of ship names and creates new ship objects to the fleet and welcomes the ship to the fleet!

Make an array of awesome ship names and build your fleet!


#### Step 12 - Bonus Step: Refactor!
You have probably typed out `Ship.prototype.functionName` enough times to realize this isn't very DRY, and your function assignments might be all over the code and it's hard to tell what functions our prototype has, refactor your Ship constructor / prototype to consolidate and clean up your code.
