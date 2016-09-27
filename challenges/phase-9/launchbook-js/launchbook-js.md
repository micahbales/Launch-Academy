Practice finding elements on the DOM using JavaScript.

You will practice how to:

- Find HTML elements
- Find HTML elements using `class` and `id` attributes
- Store JavaScript objects in variables

## Getting Started

```no-highlight
# Get the lesson slug
et get launchbook-js

# Move into the folder
cd launchbook-js

# Install gems app depends on
bundle install

# Start the app server
ruby app.rb

# Open the app in your browser
open 'http://localhost:4567'
```

## Following Along

Each section contains an example and something for you to do on your own to
reinforce the concept. You should try out each example in the browser and then
do the reinforcement exercise. Once you complete an exercise, add your code to the the `solutions.js` file. (This file is not actually run. The file is simply a place to record your answers).

**Open the JavaScript console in Chrome so that you can follow along with the
code in the following section. You can open the JavaScript console
by navigating the menu bar to `View -> Developer -> JavaScript Console` or with
the shortcut `cmd + option + j`.**

## Finding Stuff

### Find an Element by Type

JavaScript lets us use HTML class and id attributes to find elements that are in the DOM (on the page). The most basic way to find something with JavaScript is via the HTML element type.

Example: Find the status update form.

```javascript
document.getElementsByTagName("form")[0];
```

**Exercise: Find the top navbar by query for the element type, which is `<nav>`.**

### Finding Elements by their ID

We can also find an element by its **id**.

Example: Find the left sidebar by its id.

```javascript
document.getElementById('sidebar-left');
```

**Exercise: Find the sidebar on the right by using it's id.**

### Finding Elements by their Class

We can also find elements by their **class**.

Example: Find the "Favorites" section of the sidebar by using it's class.

```javascript
document.getElementsByClassName('favorites')[0];
```

**Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.**

### Finding Child Elements

We can scope our queries to child elements by chaining functions.

Example: Find all of the sections of the sidebar.

```javascript
document.getElementById('sidebar-left').getElementsByTagName('div');
```

### Querying Multiple Elements

#### Finding All Matching Elements

Example: Find all of the posts on the page by using the `.post` class.

```javascript
document.getElementsByClassName('post');
```

**Exercise: Find all of the comments on the page.**

#### Finding Specific Matching Elements

Example: Find the first post in the feed.

```javascript
document.getElementsByClassName('post')[0];
```

**Exercise: Find the first comment on the page.**

Example: Find the last post in the feed.

```javascript
var posts = document.getElementsByClassName('post');
var lastPostIndex = posts.length - 1;
posts[lastPostIndex];
```

**Exercise: Find the last comment on the page.**

Example: Find the third post in the feed.

```javascript
document.getElementsByClassName('post')[2];
```

**Exercise: Find the fourth comment on the page.**

Note: Make sure you grab the fourth *comment* rather than the fourth *block* of comments. You may need more than one line of code!

### Simple Hiding/Showing Elements

#### Hiding an Element

We can set the CSS properties of elements on the page via the `style` function.

Example: Hide the status update form.

```javascript
var statusUpdateForm = document.getElementsByClassName('status-update')[0];
statusUpdateForm.style.visibility = "hidden";
```

**Exercise: Find one of the ads in the sidebar and hide them.**

#### Showing an Element

We can change the visibility back to what it was, initially.

Example: Show the status update form.

```javascript
var statusUpdateForm = document.getElementsByClassName('status-update')[0];
statusUpdateForm.style.visibility = "visible";
```

**Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.**

### Modifying an Element's Attributes

We can use the `setAttribute` function to modify the value of an element's attribute.

Example: Change the placeholder of the status update form's `<textarea>`.

```javascript
var statusUpdate = document.getElementsByClassName('status-update')[0];
var textArea = statusUpdate.getElementsByTagName('textarea')[0];
textArea.setAttribute('placeholder', 'Hello World!');
```

**Exercise: Use `setAttribute` to change `src` attribute of one of the ads in the sidebar.**

Here's an image source if you need one: `http://placebear.com/200/300`.

### Modifying an Element's Text

We can use the `innerHTML` property of an element to change the text content of that element.

Example: Change the title of our application.

```javascript
var titleArea = document.getElementsByClassName('title-area')[0];
var listElement = titleArea.getElementsByClassName('name')[0];
var link = listElement.getElementsByTagName('a')[0];
link.innerHTML = 'Launch Academy Facebook Clone';
```

**Exercise: Find Sam's post and change it's text to something incredible.**

### Modifying an Element's Class

#### Adding a Class to an Element

Example: Add the `.active` class to the "Events" link in the left favorites sidebar.

```javascript
var favorites = document.getElementsByClassName('favorites')[0];
var eventsLink = favorites.getElementsByTagName('li')[2];
eventsLink.className = eventsLink.className + " active"
```

**Exercise: Find the first post and add the `.post-liked` class to it.**

#### Removing a Class

Example: Remove the `.active` class from the "Events" link in the left
sidebar.

```javascript
var favorites = document.getElementsByClassName('favorites')[0];
var eventsLink = favorites.getElementsByTagName('li')[2];
eventsLink.classList.remove('active');
```

**Exercise: Find the second post and remove the `.post-liked` class.**
