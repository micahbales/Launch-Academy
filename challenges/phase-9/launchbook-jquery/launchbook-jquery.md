Practice finding elements on the DOM using jQuery.

You will practice how to:

- Find HTML elements
- Find HTML elements using CSS selectors
- Store jQuery objects in variables

## Getting Started

```no-highlight
# Get the lesson slug
et get launchbook-jquery

# Move into the folder
cd launchbook-jquery

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

**Open the javascript console in Chrome so that you can follow along with the
queries listed in the following section. You can open the javascript console
by navigating the menu bar to `View -> Developer -> Javascript Console` or with
the shortcut `cmd + option + j`.**

## Finding Stuff

### Find an Element by Type

jQuery let's us use [CSS selectors](http://code.tutsplus.com/tutorials/the-30-css-selectors-you-must-memorize--net-16048),
to find elements that are in the DOM (on the page). The most basic way to find
something with jQuery is to use the element type as the CSS selector.

Example, finding the status update form:

```javascript
$('form');
```

**Exercise: Find the top navbar by query for the element type, which is  `<nav>`.**

### Finding Elements by their ID

We can also find an element by it's **id**.

Example, finding the left sidebar by it's id:

```javascript
$('#sidebar-left');
```

**Exercise: Find the sidebar on the right by using it's id.**

### Finding Elements by their Class

We can also find elements by their **class**.

Example, finding the "Favorites" section of the sidebar by using it's class:

```javascript
$('.favorites');
```

**Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.**

### Finding Child Elements

Since jQuery uses CSS selectors to find elements, we can also scope our queries
the same way you would with CSS.

Example, finding all of the sections of the sidebar:

```javascript
$('#sidebar-right div');

// Even better, this only selects div elements that are direct children of
// the sidebar container
$('#sidebar-right > div');
```

### Querying Multiple Elements

#### Finding All Matching Elements

Example, we can find all of the posts on the page by using the `.post` class:

```javascript
$('.post');
```

**Exercise: Find all of the comments on the page.**

#### Finding Specific Matching Elements

Example, finding the first post in the feed:

```javascript
$('.post:first');
$('.post').first();
```

**Exercise: Find the first comment on the page.**

Example, finding the last post in the feed:

```javascript
$('.post:last');
$('.post').last();
```

**Exercise: Find the last comment on the page.**

Example, finding the third post in the feed:

```javascript
$('.post:nth-child(3)');
```

**Exercise: Find the fourth comment on the page.**

Note: Make sure you grab the fourth *comment* rather than the fourth *block* of comments!

**Protip:** You don't want to use `$('.post')[2]` because this won't return a
jQuery object. Because the object that is returned is not a jQuery object, you
won't be able to use any of jQuery's functions on this object. In order to use
this technique and return a jQuery object, you would need to wrap the entire
query with jQuery: `$($('.post')[2]);`.

### Simple Hiding/Showing Elements

#### Hiding an Element

jQuery's [.hide()](https://api.jquery.com/hide/) can be used to easily hide an
element.

Example, hiding the status update form:

```javascript
$('.status-update').hide();
```

**Exercise: Find one of the ads in the sidebar and use `.hide()` to hide it.**

#### Showing an Element

jQuery's [.show()](http://api.jquery.com/show/) can be used to easily show an
element that is currently hidden.

Example, showing the status update form:

```javascript
$('.status-update').show();
```

**Exercise: Use `.show()` to make the ad that you hid in the previous step visible again.**

#### Toggling an Element

jQuery's [.toggle()](https://api.jquery.com/toggle/) can be used to easily show
an element that is currently hidden.

Example, toggling the status update form:

```javascript
$('.status-update').toggle();
```

**Exercise: Use `.toggle()` to toggle the display of the nav bar at the top of the page.**

### Modifying an Element's Attributes

We can use jQuery's [.attr()](https://api.jquery.com/attr/) function to modify
the value of an element's attribute.

Example, changing the placeholder of the status update form's `<textarea>`:

```javascript
var $textarea = $('.status-update textarea');
$textarea.attr('placeholder', 'Hello World!');
```

**Exercise: Use `.attr()` to change `src` attribute of one of the ads in the sidebar. Here's an image source if you need one: `http://placebear.com/200/300`.**

**Protip:** Prefixing variables with `$` is a good way to signify that it's value
is a jQuery object. This is helpful because it lets us know that we can use
jQuery's functions on this object.

### Modifying an Element's Text

We can use jQuery's [.text()](http://api.jquery.com/text/) function to change
the text content of an element.

Example, changing the title of our application:

```javascript
$('.title-area .name a').text('Launch Academy Facebook Clone');
```

**Exercise: Find Sam's post and change it's text to something incredible.**

### Modifying an Element's Class

jQuery provides some easy ways of modifying an element's class. Some of the most
used are [.addClass()](http://api.jquery.com/addclass/), [.removeClass()](https://api.jquery.com/removeClass/),
and [.toggleClass()](https://api.jquery.com/toggleClass/).

#### Adding a Class to an Element

Example, adding the `.active` class to the "News Feed" link in the left sidebar:

```javascript
var $newsFeedLink = $('.favorites li:first-child');
$newsFeedLink.addClass('active');
```

**Exercise: Find the first post and use `.addClass()` to add the `.post-liked` class to it.**

#### Removing a Class

Example, removing the `.active` class from the "News Feed" link in the left
sidebar:

```javascript
var $newsFeedLink = $('.favorites li:first-child');
$newsFeedLink.removeClass('active');
```

**Exercise: Find the second post and use `.removeClass()` to remove the `.post-liked` class.**

#### Toggling a Class

Example, toggling the `.active` class on all the links in the left sidebar:

```javascript
var $sidebarLinks = $('.favorites li');
$sidebarLinks.toggleClass('active');
```

**Exercise: Find any post and use `.toggleClass()` to toggle the `.post-liked` class.**

#### More with Classes

**Play around with the functions for modifying an elements class by finding some
posts and adding/removing/toggling the `.post-hidden` class.**
