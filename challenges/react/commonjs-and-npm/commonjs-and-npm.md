## Learning Objectives
* Learn how to split up your program into multiple files using CommonJS modules
* Use NPM packages in your code

## Installing CommonJS modules and NPM
In this article, we will be talking about CommonJS modules and NPM.
These tools come packaged with [Node](https://nodejs.org/en/), which is an environment for developing server-side Web applications in javascript.
Thus, we will install Node in order to utilize these tools.
To install Node via Homebrew, run the following command in your terminal:

```
$ brew install node
```

## CommonJS modules
Suppose we have the following file called `app.js` with the following content:

```javascript
// app.js
var growlText = "Roooarrgh ur r";
var chewbaccaGrowl = function() {
  growlText = growlText + "oo";
  console.log(growlText);
};

chewbaccaGrowl();
chewbaccaGrowl();
```

We can actually run this file by executing:

```
$ node app.js
```
If you do so, you will see the following output:

```
Roooarrgh ur roo
Roooarrgh ur roooo
```
This program is pretty great as it stands.
As our program grows, however, there will eventually be too much code in this one file and we will most likely run into namespace collisions.
An example of a possible namespace collision would be the `growlText` variable which is acting as a private variable that is only used by the `chewbaccaGrowl` function.
By keeping `growlText` in this file, we can no longer call a new variable `growlText` because if we do so, we will change the expected return value of the `chewbaccaGrowl` function.
To solve this problem we can use [CommonJS modules](http://wiki.commonjs.org/wiki/Modules/1.1.1) and split the file into two files: `app.js` and `chewbacca_growl.js`, which is going to be a module.

```javascript
// chewbacca_growl.js
var growlText = "Roooarrgh ur r";
var chewbaccaGrowl = function() {
  growlText = growlText + "oo";
  console.log(growlText);
};

module.exports = chewbaccaGrowl;
```

```javascript
// app.js
var chewbaccaGrowl = require('./chewbacca_growl');

chewbaccaGrowl();
chewbaccaGrowl();
```

In the `app.js` file, we use the `require` function which takes in a string that represents relative path of the module file whose exports you want.
Since `chewbacca_growl.js` is in the same folder as `app.js`, we prepend `./` before the name of the file.
The return value of the `require` function, will be the value assigned to `module.exports` in the module file.
If we run `node app.js`, we get the same result as before.

One benefit from this is that we have reduced the amount of code per file.
The biggest benefit, though, is that our new interface with the `chewbaccaGrowl` function has had its implementation details hidden.
In our `app.js`, we cannot change the `growlText` variable in `chewbacca_growl.js` either accidentally or on purpose.
Additionally, we can also change the name of the exported function from `chewbacca_growl.js` to avoid namespace collisions if needed.
The following changes to `app.js` illustrate the previous two points:

```javascript
// app.js
var importedChewbaccaGrowl = require('./chewbacca_growl');
var growlText = "This will not interfere with the ouput";

importedChewbaccaGrowl();
importedChewbaccaGrowl();
```
Running this code does not change our output.

## Node Package Manager (NPM)
Writing your own modules is great, but you will probably also want to use modules written by others that will aid you in your programming endeavors.
These open-source modules are called packages, and you can incorporate them using the **Node Package Manager** which is most commonly referred to as **npm**.
To use npm, we must first have a `package.json` file in our project folder.
A default one can be generated for us by running:

```
$ npm init
```

You may fill in the details if you wish, but you can simply just press enter for everything to get a `package.json` similar to this:

```json
{
  "name": "npm_example",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```
The current content of this file describes the project.
This content is useful, but it is irrelevant to our current discussion, so we will ignore it for the time being.
Now that we have a `package.json` file, we can start installing packages.
For our example, we will install [lodash](https://lodash.com/), which is a javascript utility library.
To install this package, we can run:

```
$ npm install --save lodash
```
The `--save` flag tells npm to add this package to the `package.json` file, and the last argument is the name of the package.
If we open up `package.json`, we can see that `lodash` has indeed been added under a new name called `dependencies`.
The value next to the name `lodash` denotes the semantic versioning of the package.

```json
{
  "name": "npm_example",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "lodash": "^4.2.0"
  }
}
```
You will also notice that in your project root, there is now a `node_modules` folder, which contains a `lodash` folder.
This `lodash` folder contains all the code for the `lodash` package.
Let's wipe away everything that we had previously in our `app.js` file, and let's use the `lodash` package.

```
// app.js
var _ = require('lodash');

var result = _.compact([true, false]);
console.log(result);
```

We also have to require this module, but instead of giving it a string that represents a relative path, we give it the name of the package.
Here we are using `lodash`'s [#compact](https://lodash.com/docs#compact) function, which removes all falsey values from an array.
Running this code returns `[ true ]`.

Another major benefit of having a `package.json` file which lists your project dependencies is that another developer can now download your project and install all of the project's dependencies by simply running:

```
$ npm install
```

## Installing/Uninstalling Different Kinds Of Packages
There are packages which are not needed for your application to work, but they are helpful for developing and/or testing the application.
These packages should be installed via:

```
$ npm install --save-dev name_of_package
```
These packages will be installed under the name `devDependecies` in your `package.json` file.
This is useful because when deploying to production, you can tell npm to install the dependencies in your `package.json` only found in `dependecies`, but ignore the ones found in `devDependencies`.

There are also packages which may be installed and used in the command-line. You should install these packages globally by running:

```
$ npm install -g name_of_package
```

Finally, if you ever need to uninstall a package, change `install` to `uninstall` in the command that your originally ran to install the package.
For example, to uninstall a normal dependency, you can run:

```
$ npm uninstall --save name_of_package
```

## Ruby Analogies
If you're a rubist, the following comparisons may be helpful in understanding
the NPM ecosystem:

* `npm install` is like `bundle install`.
* `package.json` is like your `Gemfile` file.
* The packages in the `dependencies` of your `package.json` are like the gems
    not listed under any `group` in your `Gemfile`.
* The packages in the `devDependencies` of your `package.json` are like the gems
    listed under `group :test, :development do` in your `Gemfile`.
* `var _ = require('lodash');` is analogous to `require 'pry'`.
* `var chewbaccaGrowl = require('./chewbacca_growl');` is analogous to
    `require_relative('name_of_file_in_the_same_directory.rb')`.

## Summary
In this article, we learned how to use modules to split our code into several files.
This has many advantages including reducing the of amount of code per file, hiding implementation details of an interface, and avoiding namespace collisions.

We also learned how to reuse functionality from libraries by downloading packages with npm.
Additionally, npm creates a `package.json` file which lists all of the project's dependecies, and thus makes it easier for developers in a team to install missing project dependencies and add new dependencies to the project.

## Additional Resources
* [CommonJS Modules Documentation](http://wiki.commonjs.org/wiki/Modules/1.1.1)
* [CommonJS Module Examples In Node](https://nodejs.org/api/modules.html)
* [NPM Getting Started](https://docs.npmjs.com/getting-started/what-is-npm)
